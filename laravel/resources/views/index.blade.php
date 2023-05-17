<x-guest-layout>
    <div class="h-screen md:flex overflow-auto">
        <div class="w-full sm:w-8/12 md:w-7/12 lg:w-9/12 h-96 sm:h-screen overflow-hidden" id="map"></div>
        <div class="w-full sm:w-4/12 md:w-5/12 lg:w-3/12 sm:h-screen sm:overflow-scroll bg-gray-100" id="filter">
            <div class="bg-gray-300">
                <div class="hidden py-2 px-3" id="details">
                    <div class="font-bold">Ort</div>
                    <div class="mb-2" id="place"></div>
                    <div class="font-bold">Baumart</div>
                    <div class="mb-2" id="type"></div>
                    <div class="font-bold">Baummodel</div>
                    <div class="mb-2" id="model"></div>
                    <div class="font-bold">Pflanzjahr</div>
                    <div class="mb-2" id="plant"></div>
                    <div class="font-bold">Baumumfang</div>
                    <div class="mb-2" id="scope"></div>
                    <div class="font-bold">Baumkrone</div>
                    <div class="mb-2" id="crown"></div>
                    <div class="font-bold">Baumhöhe</div>
                    <div id="height"></div>
                </div>
            </div>
            <div class="py-2 px-3">
                <h1 class="text-2xl md:text-3xl font-bold">
                    Baumkataster
                </h1>
                <h2 class="text-xl md:text-2xl mb-4 md:mb-8">
                    Stadt Gelsenkirchen
                </h2>
                <h3 class="text-xl md:text-2xl mb-1 md:mb-3">
                    Datenquelle
                </h3>
                <p class="font-mono mb-4 md:mb-8">Die Stadt Gelsenkirchen hat ihr
                    Baumkataster in einer CSV Datei auf deren Opendata Portal zum <a
                        class="text-blue-600 hover:text-blue-500 focus:text-blue:500"
                        href="https://opendata.gelsenkirchen.de/sites/default/files/baumkataster_ge.csv"
                        target="_blank">download</a> angeboten.
                </p>
                <h3 class="text-xl md:text-2xl mb-1 md:mb-3">Interaktive Karte</h3>
                <p class="font-mono mb-4 md:mb-8">Beispielanwendung einer Baumkartasterkarte mit Daten der Stadt
                    Gelsenkirchen als Beispiel für eine Entscheidungsgrundlage der Stadt Flensburg.</p>
                <h3 class="text-xl md:text-2xl mb-1 md:mb-3">Quellcode</h3>
                <p class="font-mono"><a class="text-blue-600 hover:text-blue-500 focus:text-blue:500"
                        href="https://github.com/oklabflensburg/open-trees-map" target="_blank">GitHub</a>
                </p>
            </div>
        </div>
    </div>
</x-guest-layout>
