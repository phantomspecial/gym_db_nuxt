<template>
  <div id="app">
    <div id="search_form" class="container pb-5 pt-5">
      <form @submit.prevent="searchGym()">
        <div class="form-group row">
          <div class="col-md-4">
            <label>都道府県</label>
          </div>
          <div class="col-md-8">
            <select v-model="query.pref" class="form-control">
              <option value="">
                選択してください
              </option>
              <option v-for="pref in prefs" :key="pref.id" :value="pref.id">
                {{ pref.name }}
              </option>
            </select>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-md-4">
            <label>フリーテキスト</label>
          </div>
          <div class="col-md-8">
            <input v-model="query.keyword" class="form-control" placeholder="入力してください">
          </div>
        </div>
        <div class="form-group row justify-content-center">
          <div class="col-md-6">
            <button type="submit" class="btn btn-primary col-md-12">
              検索
            </button>
          </div>
        </div>
      </form>
    </div>
    <GymList :gym-list="gym_list" :searched="searched" :is-loading="isLoading" :is-gym-present="existGymList" @openModal="openModal" />
    <ModalDetail v-if="modal" :gym-detail="gym_detail" @close="modal=false" />
  </div>
</template>

<script>
import ModalDetail from '~/components/gyms/modal'
import GymList from '~/components/gyms/list'

export default {
  components: {
    GymList,
    ModalDetail
  },
  layout: 'gym',
  asyncData ({ $axios, params }) {
    return $axios.$get('/api/prefectures').then((res) => {
      return { prefs: res.prefectures }
    })
  },
  data () {
    return {
      query: {
        pref: '',
        keyword: ''
      },
      prefs: [],
      gym_list: [],
      gym_detail: {},
      searched: false,
      isLoading: false,
      modal: false
    }
  },
  computed: {
    existGymList () {
      return this.gym_list.length !== 0
    }
  },
  methods: {
    searchGym () {
      this.isLoading = true
      this.$axios.$get('/api/gyms/search.json', { params: this.query }).then((response) => {
        this.gym_list = response.gym_list
        this.searched = true
        this.isLoading = false
      }, (error) => {
        // eslint-disable-next-line no-console
        console.log(error)
      })
    },
    fetchGymDetail (gymId) {
      this.$axios.$get('/api/gyms/' + gymId + '.json').then((response) => {
        this.gym_detail = response.gym_detail
      }, (error) => {
        // eslint-disable-next-line no-console
        console.log(error)
      })
    },
    openModal (gymId) {
      this.fetchGymDetail(gymId)
      this.modal = true
    }
  }
}
</script>

<style scoped lang="scss">
</style>
