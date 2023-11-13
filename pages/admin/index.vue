<template>
  <NuxtLayout name="admin-layout">
    <div class="flex px-5 py-1 bg-green-900 max-md:w-full">    
      <div class="flex flex-rows w-full justify-between">
        <div class="pl-1 py-2">
          <h1 class="text-xl font-semibold text-white">Admin Dashboard</h1>
        </div>
        <!-- Right content -->
        <div class="relative my-1 z-10">
        <button
        v-if="!loading"
          @click="isOpen = !isOpen"
          class="inline-flex items-center justify-center  font-bold text-md  text-white border-none"
          aria-expanded="false"
        >
          {{ this.person }}
        
          <svg
            class="-mr-1 ml-2 h-5 w-5"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 20 20"
            fill="currentColor"
            aria-hidden="true"
          >
            <path
              fill-rule="evenodd"
              d="M6 8l4 4 4-4H6z"
              clip-rule="evenodd"
            ></path>
          </svg>
        </button>
        <div
          v-if="isOpen"
          class="origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none"
          role="menu"
          aria-orientation="vertical"
          aria-labelledby="options-menu"
        >
          <div class="py-1 px-2" role="none">
            <!-- Dropdown options -->
            <NuxtLink class=" text-black flex flex-cols text-md font-lg cursor-pointer my-3 gap-2" to="/">
              <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 24 24"> <g> <path fill="none" d="M0 0h24v24H0z"/> <path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2a9.985 9.985 0 0 1 8 4h-2.71a8 8 0 1 0 .001 12h2.71A9.985 9.985 0 0 1 12 22zm7-6v-3h-8v-2h8V8l5 4-5 4z"/> </g> </svg>
              Logout
            </NuxtLink>
          </div>
        </div>
      </div>
        
      </div>
  </div> 
  <div class="mx-4 lg:w-full md: w-screen">
    <div v-if="!loading" class="grid gap-6 lg:grid-cols-5 py-4 md:grid-cols-3">
      <!-- Grid starts here -->
      <div class="flex items-center bg-blue-500 rounded shadow-sm justify-between p-5">
          <div>
              <div class="text-sm text-gray-50">Total Users</div>
          <div class="flex items-center pt-1">
              <div class="text-3xl font-medium text-gray-600 p-1">{{ this.OrgCounts.total }}</div>        
          </div>                          
          </div>
          <div class="text-gray-100">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12.75 15l3-3m0 0l-3-3m3 3h-7.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
              </div>
      </div>
      <div class="flex items-center bg-red-500 rounded shadow-sm justify-between p-5">
          <div>
              <div class="text-sm text-gray-50">UMYF</div>
          <div class="flex items-center pt-1">
              <div class="text-3xl font-medium text-gray-600 p-1">{{ this.OrgCounts.umyf }}</div>        
          </div>                          
          </div>
          <div class="text-gray-100">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12.75 15l3-3m0 0l-3-3m3 3h-7.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
              </div>
      </div>  
      <div class="flex items-center bg-green-600 rounded shadow-sm justify-between p-5">
        <div>
            <div class="text-sm text-gray-50">JSS</div>
        <div class="flex items-center pt-1">
            <div class="text-3xl font-medium text-gray-600 p-1">{{ this.OrgCounts.jss }}</div>        
        </div>                          
        </div>
        <div class="text-gray-100">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12.75 15l3-3m0 0l-3-3m3 3h-7.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
            </div>
      </div>
      <div class="flex items-center bg-yellow-500 rounded shadow-sm justify-between p-5">
        <div>
            <div class="text-sm text-gray-50">RRW</div>
        <div class="flex items-center pt-1">
            <div class="text-3xl font-medium text-gray-600 p-1">{{ this.OrgCounts.rrw }}</div>        
        </div>                          
        </div>
        <div class="text-gray-100">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12.75 15l3-3m0 0l-3-3m3 3h-7.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
            </div>
    </div>
    <div class="flex items-center bg-pink-600 rounded shadow-sm justify-between p-5">
        <div>
            <div class="text-sm text-gray-50">MUMC</div>
        <div class="flex items-center pt-1">
            <div class="text-3xl font-medium text-gray-600 p-1">{{ this.OrgCounts.mumc }}</div>        
        </div>                          
        </div>
        <div class="text-gray-100">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12.75 15l3-3m0 0l-3-3m3 3h-7.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
            </div>
    </div>
  
      <!-- Grid ends here -->
  </div>
  
  <h1  class="text-gray-900 text-3xl font-semibold my-1">Accounts</h1>
  <h1 v-if="loading" class="text-gray-900 text-3xl font-semibold my-1">Loading accounts</h1>
  <div v-else class="relative overflow-x-auto mb-5 shadow-md sm:rounded-lg lg:w-full md: w-screen">
                  <table class="lg:w-full md:w-screen text-sm text-left text-gray-500 dark:text-gray-400">
                      <thead class="text-xs text-white uppercase bg-green-900 dark:bg-gray-700 dark:text-gray-400">
                          <tr>
                            <th scope="col" class="px-4 py-3">
                              ID
                          </th>
                              <th scope="col" class="px-4 py-3">
                                Membership Number
                              </th>
                              <th scope="col" class="px-4 py-3">
                                First Name
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Last Name
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Gender
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Date Of Birth
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Organisation
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Status
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Local
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Section
                              </th>
                              <th scope="col" class="px-4 py-3">
                                Role
                              </th>
                              <th scope="col" class="px-4 py-3">
                                  
                              </th>
                              <th scope="col" class="px-4 py-3"></th>
                          </tr>
                      </thead>
                      <tbody>
                        
                          <tr v-for="item in filteredItems" :key="item.id" class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
                            <td class="px-6 py-4">{{ item.id }}</td>
                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                              {{ item.membershipNumber }}
                          </th>
                            <td class="px-4 py-4">{{ item.firstname }}</td>
                            <td class="px-4 py-4">{{ item.lastname }}</td>
                            <td class="px-4 py-4">{{ item.gender }}</td>
                            <td class="px-4 py-4">{{ item.dateOfBirth }}</td>
                            <td class="px-4 py-4">{{ item.organisation }}</td>
                            <td class="px-4 py-4">{{ item.membershipStatus }}</td>
                            <td class="px-4 py-4">{{ item.locals.name }}</td>
                            <td class="px-4 py-4">{{ item.section.name }}</td>
                            <td class="px-4 py-4">{{ item.role }}</td>
                            
                          </tr>
                      </tbody>
                  </table>
                  <div v-if="!loading" class="text-md text-white flex flex-row justify-end bg-green-900 px-8 lg:w-full md:w-screen">

                        <button class="p-3" @click="getAllUsers(pageNumber)"  v-for="pageNumber in this.totalPages" :key="pageNumber">
                          {{ pageNumber }} 
                        </button>
                  </div>
  </div>
  </div>

  </NuxtLayout>
</template>

<script>
import axios from 'axios'
import { encryptData, decryptData } from '@/encryption';
export default {
  data() {
    return {
      sectionFilter: '',
      surnameFilter: '',
      addModal: false,
      isSelected: false,
      editModal: false,
      deleteModal: false,
      editModalHeading: 'Edit user account',
      addModalHeading: 'Add new user',
      loading:true,
      person: '',
      user : '',
      isOpen: false,
      name: '',
      item: [{
        id: '',
        firstname: '',
        lastname: '',
        gender: '',
        dateOfBirth: "",
        membershipNumber: '',
        role: '',
        organisation: '',
        membershipStatus: '',
        section: [],
        locals: [],
      }],
      errors: {},
      users: {
        id: '',
        firstname: '',
        lastname: '',
        gender: '',
        dateOfBirth: "",
        membershipNumber: '',
        role: '',
        organisation: '',
        membershipStatus: '',
        section: [],
        locals: [],
      },
      items: [{
        id: '',
        firstname: '',
        lastname: '',
        gender: '',
        dateOfBirth: "",
        membershipNumber: '',
        role: '',
        organisation: '',
        membershipStatus: '',
        section: [],
        locals: [],
    }],
    locs:[],
    pages:[],
    result:[],
    OrgCounts: '',
    page: '0',
    totalPages: ''
    };
  },
  computed: {
    filteredItems() {
      let filteredItems = this.items;

      if (this.sectionFilter) {
        filteredItems = filteredItems.filter((item) => item.Section === this.sectionFilter);
      }

      if (this.surnameFilter) {
        filteredItems = filteredItems.filter(
          (item) => item.user.lastname.toLowerCase().includes(this.surnameFilter.toLowerCase())
        );
      }

      return filteredItems;
    },
    sections() {
      return [...new Set(this.items.map((item) => item.Section))];
    },
  },
  methods:{
    async getAllUsers(pageNumber){
    this.loading = true;
    Number.parseInt(pageNumber)
    pageNumber -=1;
    const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
    const URL = `https://chitma.hushsoft.co.zw/api/api/v1/auth/getAllUsersAccounts/${pageNumber}/${local}`;
    const token = localStorage.token;
    await axios.get(URL,{
      headers: {'Content-Type': 'application/json',
          // Authorization : 'Bearer ' + token,
          'Access-Control-Allow-Origin': '*'}
    }).then((res) =>
     {
      this.result = res.data
      this.items = res.data.content
      this.pages = res.data.pageable
      this.totalPages = res.data.totalPages
    }) .catch(error => {
      console.log(error.code)
      this.error=error.code;
      this.errored = true

    }).finally(() => this.loading = false);
    },
    async getAdminInfo(){
      this.loading = true;
      const mN = localStorage.getItem('mN');
      const mbnD = decryptData(mN);
      const URL = `https://chitma.hushsoft.co.zw/api/api/v1/auth/getUserByMembershipNumber/${mbnD}`;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.adminInfo = res.data
        this.user = this.adminInfo
        this.person = this.user.firstname
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
      async getOrganisationCounts(){
      this.loading = true;
      const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
      const URL = `https://chitma.hushsoft.co.zw/api/api/v1/auth/getUsersCountByOrganisationAnd/${local}`;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.OrgCounts = res.data
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
 
},
mounted(){
    this.getAllUsers(1)
    this.getAdminInfo()
    this.getOrganisationCounts()
  }
}
</script>


<style>

</style>