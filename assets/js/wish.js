(function(){
    var tiles = [].slice.call(document.getElementsByClassName('tile'));
    tiles.forEach(function(tile){
        tile.addEventListener('mouseenter', function(){
            tile.classList.add('flipped');
        });

        tile.addEventListener('mouseleave', function(){
            tile.classList.remove('flipped');
        });
    });
})();
