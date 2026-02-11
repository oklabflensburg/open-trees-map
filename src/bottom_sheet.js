/**
 * Mobile bottom sheet with swipe and close functionality
 */
export class BottomSheet {
  constructor(element, options = {}) {
    this.element = element
    this.options = {
      closedHeight: 60, // height when closed (px)
      openHeight: window.innerHeight * 0.8, // 80% of viewport when open
      snapThreshold: 0.3, // snap threshold ratio (30%)
      animationDuration: 300, // ms
      ...options
    }

    this.state = {
      isOpen: false,
      isDragging: false,
      startY: 0,
      startHeight: 0,
      currentHeight: 0,
      velocity: 0,
      lastTime: 0
    }

    // Create handle element
    this.handle = document.createElement('div')
    this.handle.className = 'bottom-sheet-handle'
    this.handle.innerHTML = `
      <div class="handle-bar"></div>
      <button class="close-button" aria-label="Close panel">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M18 6L6 18M6 6l12 12"/>
        </svg>
      </button>
    `

    // Insert handle at the top of the panel
    this.element.insertBefore(this.handle, this.element.firstChild)

    // Close button
    this.closeButton = this.handle.querySelector('.close-button')
    this.closeButton.addEventListener('click', () => this.close())

    // Touch events
    this.handle.addEventListener('touchstart', this.onTouchStart.bind(this))
    this.handle.addEventListener('mousedown', this.onMouseDown.bind(this))
    this.element.addEventListener('touchstart', this.onTouchStart.bind(this), { passive: true })
    this.element.addEventListener('mousedown', this.onMouseDown.bind(this))

    // Prevent drag on form elements
    const formElements = this.element.querySelectorAll('input, select, button, label')
    formElements.forEach(el => {
      el.addEventListener('touchstart', (e) => e.stopPropagation())
      el.addEventListener('mousedown', (e) => e.stopPropagation())
    })

    // Initialize height
    this.setHeight(this.options.closedHeight)
    this.state.currentHeight = this.options.closedHeight

    // Add transition for smooth animation
    this.element.style.transition = `height ${this.options.animationDuration}ms ease-out`

    // Bind global events
    this.onTouchMove = this.onTouchMove.bind(this)
    this.onTouchEnd = this.onTouchEnd.bind(this)
    this.onMouseMove = this.onMouseMove.bind(this)
    this.onMouseUp = this.onMouseUp.bind(this)

    // Add CSS classes
    this.element.classList.add('bottom-sheet')
    this.handle.classList.add('bottom-sheet-handle')
  }

  setHeight(height) {
    const maxHeight = window.innerHeight * 0.95
    const minHeight = this.options.closedHeight
    const clampedHeight = Math.max(minHeight, Math.min(height, maxHeight))
    this.element.style.height = `${clampedHeight}px`
    this.state.currentHeight = clampedHeight
  }

  onTouchStart(e) {
    if (e.target.closest('button, input, select, label')) return
    this.startDrag(e.touches[0].clientY)
    e.preventDefault()
  }

  onMouseDown(e) {
    if (e.target.closest('button, input, select, label')) return
    this.startDrag(e.clientY)
    e.preventDefault()
  }

  startDrag(startY) {
    this.state.isDragging = true
    this.state.startY = startY
    this.state.startHeight = this.state.currentHeight
    this.state.lastTime = Date.now()
    this.state.velocity = 0

    // Disable transition while dragging
    this.element.style.transition = 'none'

    // Add dragging class
    this.element.classList.add('dragging')

    // Add global event listeners
    document.addEventListener('touchmove', this.onTouchMove, { passive: false })
    document.addEventListener('touchend', this.onTouchEnd)
    document.addEventListener('mousemove', this.onMouseMove)
    document.addEventListener('mouseup', this.onMouseUp)
  }

  onTouchMove(e) {
    if (!this.state.isDragging) return
    this.updateDrag(e.touches[0].clientY)
    e.preventDefault()
  }

  onMouseMove(e) {
    if (!this.state.isDragging) return
    this.updateDrag(e.clientY)
  }

  updateDrag(currentY) {
    const delta = this.state.startY - currentY
    const newHeight = this.state.startHeight + delta

    // Calculate velocity
    const now = Date.now()
    const timeDelta = now - this.state.lastTime
    if (timeDelta > 0) {
      this.state.velocity = delta / timeDelta
    }
    this.state.lastTime = now

    this.setHeight(newHeight)
  }

  onTouchEnd() {
    this.endDrag()
  }

  onMouseUp() {
    this.endDrag()
  }

  endDrag() {
    if (!this.state.isDragging) return
    this.state.isDragging = false

    // Remove global event listeners
    document.removeEventListener('touchmove', this.onTouchMove)
    document.removeEventListener('touchend', this.onTouchEnd)
    document.removeEventListener('mousemove', this.onMouseMove)
    document.removeEventListener('mouseup', this.onMouseUp)

    // Re-enable transition
    this.element.style.transition = `height ${this.options.animationDuration}ms ease-out`

    // Remove dragging class
    this.element.classList.remove('dragging')

    // Snap to open or closed based on velocity and position
    this.snapToNearest()
  }

  snapToNearest() {
    const { currentHeight, velocity } = this.state
    const { closedHeight, openHeight, snapThreshold } = this.options

    // Calculate target based on velocity (swipe momentum)
    const momentum = velocity * 50 // arbitrary multiplier
    const projectedHeight = currentHeight + momentum

    // Determine which state is closer
    const distanceToOpen = Math.abs(projectedHeight - openHeight)
    const distanceToClosed = Math.abs(projectedHeight - closedHeight)

    // Use threshold for hysteresis
    const openRatio = (currentHeight - closedHeight) / (openHeight - closedHeight)

    if (openRatio > snapThreshold || distanceToOpen < distanceToClosed) {
      this.open()
    } else {
      this.close()
    }
  }

  open() {
    this.setHeight(this.options.openHeight)
    this.state.isOpen = true
    this.element.classList.add('open')
    this.element.classList.remove('closed')
  }

  close() {
    this.setHeight(this.options.closedHeight)
    this.state.isOpen = false
    this.element.classList.add('closed')
    this.element.classList.remove('open')
  }

  toggle() {
    if (this.state.isOpen) {
      this.close()
    } else {
      this.open()
    }
  }

  updateHeights() {
    this.options.openHeight = window.innerHeight * 0.8
    if (!this.state.isOpen) {
      this.setHeight(this.options.closedHeight)
    } else {
      this.setHeight(this.options.openHeight)
    }
  }

  destroy() {
    // Clean up event listeners
    document.removeEventListener('touchmove', this.onTouchMove)
    document.removeEventListener('touchend', this.onTouchEnd)
    document.removeEventListener('mousemove', this.onMouseMove)
    document.removeEventListener('mouseup', this.onMouseUp)
  }
}