<template>
  <div>
    <table class="table table-bordered table-hover table-sm">
      <tbody>
        <tr>
          <th>ジムカテゴリ</th>
          <td>{{ gymDetail.master_gym_name }}</td>
        </tr>
        <tr>
          <th>ジム名</th>
          <td>{{ gymDetail.shop_name }}</td>
        </tr>
        <tr>
          <th>ジム情報ID</th>
          <td>{{ gymDetail.id }}</td>
        </tr>
        <tr>
          <th>ジム名</th>
          <td>{{ gymDetail.master_gym_name }}</td>
        </tr>
        <tr>
          <th>都道府県</th>
          <td>{{ gymDetail.master_pref_name }}</td>
        </tr>
        <tr>
          <th>店舗名</th>
          <td>{{ gymDetail.shop_name }}</td>
        </tr>
        <tr>
          <th>郵便番号</th>
          <td>{{ gymDetail.post_address }}</td>
        </tr>
        <tr>
          <th>電話番号</th>
          <td>{{ gymDetail.tel_no }}</td>
        </tr>
        <tr>
          <th>住所</th>
          <td>{{ gymDetail.address }}</td>
        </tr>
        <tr>
          <th>アクセス</th>
          <td>{{ gymDetail.access }}</td>
        </tr>
        <tr>
          <th>営業日・休館日</th>
          <td>{{ gymDetail.opening_hours }}</td>
        </tr>
        <tr>
          <th>駐車場・駐輪場</th>
          <td>{{ gymDetail.parking }}</td>
        </tr>
        <tr>
          <th>ジム設備</th>
          <td>{{ gymDetail.facility }}</td>
        </tr>
        <tr>
          <th>その他情報1</th>
          <td>{{ gymDetail.other_info1 }}</td>
        </tr>
        <tr>
          <th>URL</th>
          <td><a :href="gymDetail.url" target="_blank">{{ gymDetail.url }}</a></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  layout: 'gym',
  asyncData ({ $axios, params }) {
    return $axios.$get(`/api/gyms/${params.id}.json`).then((response) => {
      return { gymDetail: response.gym_detail }
    }, (error) => {
      // eslint-disable-next-line no-console
      console.log(error)
    })
  },
  data () {
    return {
      gymDetail: {}
    }
  }
}
</script>
