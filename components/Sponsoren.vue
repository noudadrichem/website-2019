<template>
  <div class="sponsoren">
    <h5 class="center">Sponsoren</h5>
    <ul>
      <li v-for="(s, idx) in sponsoren" :key="idx">
        <img :src="s.path" alt="sponsor logo title" />
      </li>
    </ul>

  </div>
</template>

<script>
export default {
  name: 'Sponsoren',
  data: () => ({
    sponsoren: [
      {
        path: '/partners/axians-logo.png'
      },
      {
        path: '/partners/bpm-logo.png'
      },
      {
        path: '/partners/cambridgebar-logo.png'
      },
      {
        path: '/partners/experius-logo.png'
      },
      {
        path: '/partners/ordina-logo.svg'
      },
      {
        path: '/partners/snow-logo.svg'
      },
      {
        path: '/partners/sogeti-logo.svg'
      }
    ]
  })
}
</script>

<style lang="scss">
.sponsoren {
  padding: 8px 0 32px;
  background: #fff;
  box-shadow: inset 0 -1px 0 0 #C6D1E0, inset 0 1px 0 0 #C6D1E0;

  h5 {
    margin-bottom: 16px;
  }

  ul {
    max-width: 1280px;
    margin: 0 auto;
    display: flex;
    overflow: auto;
    justify-content: space-between;

    li  {
      max-width: 108px;
      display: inline-flex;
      align-items: center;

      &:hover {
        img {
          filter: grayscale(0%);
        }
      }

      img {
        max-width: 100%;
        filter: grayscale(100%);
        transition: all 200ms;
      }

    }
  }
}
</style>
