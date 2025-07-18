// MENU LATERAL
document.addEventListener('DOMContentLoaded', function () {
  const trigger = document.getElementById('menu-trigger');
  const menu = document.getElementById('side-menu');

  if (trigger && menu) {
    trigger.addEventListener('click', () => {
      menu.classList.toggle('active');
    });

    menu.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', () => {
        menu.classList.remove('active');
      });
    });
  }
});
