<template>
  <div>
    <no-ssr>
      <vue-simple-spinner v-show="isLoading" />
    </no-ssr>
    <div v-if="searched && !isLoading" id="result">
      <table v-if="isGymPresent" class="table table-bordered table-hover table-sm">
        <thead>
          <tr>
            <th>ジム名</th>
            <th>都道府県</th>
            <th>店舗名</th>
            <th>郵便番号</th>
            <th>電話番号</th>
            <th>住所</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="gym in gymList" :key="'gbi_' + gym.id" @click="openModal(gym.id)">
            <td>{{ gym.master_gym_name }}</td>
            <td>{{ gym.master_pref_name }}</td>
            <td>{{ gym.shop_name }}</td>
            <td>{{ gym.post_address }}</td>
            <td>{{ gym.tel_no }}</td>
            <td>{{ gym.address }}</td>
          </tr>
        </tbody>
      </table>
      <div v-else class="text-center">
        該当するジムはありません。
      </div>
    </div>
  </div>
</template>

<script>

export default {
  props: {
    gymList: {
      type: Array,
      required: true
    },
    searched: {
      type: Boolean,
      required: true
    },
    isLoading: {
      type: Boolean,
      required: true
    },
    isGymPresent: {
      type: Boolean,
      required: true
    }
  },
  methods: {
    openModal (gymId) {
      this.$emit('openModal', gymId)
    }
  }
}

</script>

<style scoped lang="scss">
  .modal {
    display: block;
  }
  .modal-dialog {
    z-index: 1500;
  }
</style>
