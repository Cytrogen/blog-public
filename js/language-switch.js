document.addEventListener('DOMContentLoaded', function() {
    const languageToggle = document.querySelector('.language-toggle');
    const languageDropdown = document.querySelector('.language-dropdown');

    if (languageToggle && languageDropdown) {
        languageToggle.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            languageDropdown.classList.toggle('hidden');
        });

        languageDropdown.addEventListener('click', function(e) {
            e.stopPropagation();
        });

        document.addEventListener('click', function() {
            languageDropdown.classList.add('hidden');
        });

        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                languageDropdown.classList.add('hidden');
            }
        });
    }
});