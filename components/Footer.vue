<template>
  <footer>
    <div class="container">
      <div class="column">
        <h4>Pagina's</h4>
        <ul class="footer-menu pages">
          <li v-for="(menuItem, idx) in menuItems" :key="idx">
            <a :href="menuItem.link">{{ menuItem.title }}</a>
          </li>
        </ul>
      </div>

      <div class="column">
        <h4>Contact</h4>
        <ul class="footer-menu contact">
          <li v-for="(value, key) in contactInfo" :key="key">
            {{ value }}
          </li>
        </ul>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  data: () => ({
    contactInfo: {
      address: 'Heidelberglaan 15',
      postcode: '3584 CS Utrecht',
      lokaal: 'HL15-4.092',
      email: 'bestuur@indicium.hu'
    },
    menuItems: [
      {
        title: 'Inschrijven',
        link: 'https://docs.google.com/forms/d/e/1FAIpQLSeYE3T-IdYrxb1FB2wKGtltf5D16aLzsDdaW3g1IZAj5Lxj3Q/viewform'
      },
      {
        title: 'Vacatures',
        link: '#'
      },
      {
        title: 'Statuten',
        link: '/statuten'
      },
      {
        title: 'Over',
        link: '/over-indicium'
      },
      {
        title: 'Uitleenservice',
        link: '#'
      },
      {
        title: 'Activiteiten',
        link: '/activiteiten'
      },
      {
        title: 'Sponsoren en partners',
        link: '/partners'
      },
    ]
  })

}
</script>

<style lang="scss" scoped>
@import '../assets/scss/variables.scss';

footer {
  background: #DBEFF4;
  padding: 80px;
  color: var(--text-color);

  @media screen and (max-width: $bp-tablet-sm) {
    padding: 12px;
  }

  .container {
    max-width: 1084px;
    margin: 0 auto;
    padding: 0 24px;
    display: flex;
    justify-content: space-between;

    @media screen and (max-width: $bp-tablet-sm) {
      display: block;
    }

    .footer-menu {

      &.pages {
        columns: 2;
      }

      li {
        line-height: 1.6;
      }
    }
  }
}
</style>
