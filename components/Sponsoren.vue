<template>
  <div class="sponsoren">
    <h5 class="center">Sponsoren</h5>
    <slick
      :options="slickOptions"
    >
      <img v-for="(s, idx) in sponsoren" :src="s.path" alt="sponsor logo title" :key="idx" />
    </slick>

  </div>
</template>

<script>
/* eslint-disable */
export default {
  name: 'Sponsoren',
  data: () => ({
    slickOptions: {
      slidesToShow: 7,
      variableWidth: true,
      slidesToScroll: 1,
       responsive: [{
        breakpoint: 1100,
        settings: {
          slidesToShow: 2,
          autoplay: true,
          prevArrow: false,
          nextArrow: false,
        }
      }]
    },
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
        path: '/partners/ordina-logo.svg'
      },
      {
        path: '/partners/experius-logo.png'
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
@import '../assets/scss/variables.scss';

.sponsoren {
  background: #fff;
  box-shadow: inset 0 -1px 0 0 #C6D1E0, inset 0 1px 0 0 #C6D1E0;
  padding: 8px 0 32px;
  overflow: hidden;

  @media screen and (max-width: $bp-tablet-sm) {
    padding: 8px 0 12px;
  }

  h5 {
    margin-bottom: 16px;
  }

  .slick-slider {
    width: 90%;
    margin: 0 auto;
    box-sizing: border-box;
    position: relative;

    @media screen and (max-width: $bp-tablet-sm) {
      width: 100%;
      padding-bottom: 32px;
    }

    .slick-prev,
    .slick-arrow {
      position: absolute;
      bottom: 0;
      left: 0;
      color: var(--text-color);

      &.slick-next {
        left: auto;
        right: 0
      }

    }

    .slick-track {
      display: flex;
      align-items: center;


      .slick-slide {
        width: 128px;
        padding: 0 32px;
        display: inline-flex;
        justify-content: center;
      }
    }

  //  @media screen and (max-width: $bp-tablet-sm) {
  //     width: 100vw;
  //
  }

  // // ul {
  // //   max-width: 1280px;
  // //   margin: 0 auto;
  // //   display: flex;
  // //   overflow: auto;
  // //   justify-content: space-between;

  //   .slick-slide  {
  //     width: 100px;
  //     // max-width: 108px;
  //     // display: inline-flex;
  //     // align-items: center;
  //     box-sizing: border-box;


  //     // @media screen and (max-width: $bp-tablet-sm) {
  //     //   max-width: none;
  //     //   // flex-basis: 100%;
  //     //   // flex: 1;
  //     //   display: block;
  //     //   width: 100px;
  //     // }

  //     &:hover {
  //       img {
  //         filter: grayscale(0%);
  //       }
  //     }

  //     img {
  //       max-width: 100%;
  //       filter: grayscale(100%);
  //       transition: all 200ms;
  //     }

  //   }
  // }
}
</style>
