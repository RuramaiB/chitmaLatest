<template>
    <NuxtLayout name="finance-layout">
      <div class="bg-blue-900 flex justify-between px-10 py-3 lg:w-full md:w-screen">
          <p class="text-white font-semibold text-lg">Users</p>
          <div class=" my-1 z-10 md:mr-8 lg:mr-2">
          <button
            @click="isOpen = !isOpen"
            v-if="!loading"
            class="inline-flex items-center justify-center  font-bold text-md  text-white border-none"
            aria-expanded="false"
          >
            {{ this.person}}
          
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
      <div class="mt-1 p-4 gap-3 lg:w-full md:w-screen">
        <div class="flex justify-between">
          <div class="mb-4">
                  <label for="surnameFilter" class="block font-medium mb-1">Filter by Surname:</label>
                  <input
                    v-model="surnameFilter"
                    id="surnameFilter" 
                    type="text"
                    class="border border-gray-300 rounded-md px-4 py-2 w-full"
                    placeholder="Search by surname..."
                  />
          </div>
          </div>
        <div class="relative overflow-x-auto mb-5 shadow-md lg:w-full md:w-screen">
          <table class="lg:w-full md:w-screen text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-white uppercase bg-blue-900 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                              <th scope="col" class="px-4 py-3 md:px-2 md:py-1">
                                ID
                            </th>
                                <th scope="col" class="px-4 py-3 md:px-2 md:py-1">
                                  Membership Number
                                </th>
                                <th scope="col" class="px-4 py-3 md:px-2 md:py-1">
                                  First Name
                                </th>
                                <th scope="col" class="px-4 py-3 md:px-2 md:py-1">
                                  Last Name
                                </th>
                                <th scope="col" class="px-4 py-3 md:px-2 md:py-1">
                                  Gender
                                </th>
                                <th scope="col" class="px-4 py-3 md:px-2 md:py-1">
                                  Date Of Birth
                                </th>
                                <th scope="col" class="px-4 py-3 md:px-2 md:py-1">
                                  Organisation
                                </th>
                                <th scope="col" class="px-4 py-3 md:px-2 md:py-1">
                                  Status
                                </th>
                                <th scope="col" class="px-4 py-3 md:px-2 md:py-1">
                                  Local
                                </th>
                                <th scope="col" class="px-4 py-3 md:px-2 md:py-1">
                                  Section
                                </th>
                
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
                              <!-- <td class="px-4 py-4">{{ item.role }}</td> -->
                            </tr>
                        </tbody>
          </table>
          <div v-if="!loading" class="text-md text-white flex flex-row justify-end bg-blue-900 px-8 lg:w-full md:w-screen">
            <button class="p-3" @click="getAllUsers(pageNumber)"  v-for="pageNumber in this.result.totalPages" :key="pageNumber">
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
        firstnameFilter: '',
        addModal: false,
        editModal: false,
        deleteModal: false,
        editModalHeading: 'Edit user account',
        addModalHeading: 'Add new user',
        loading:true,
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
       
      result:[],
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
          pages:[],
          result:[],
      }],
      locs:[],
      pages:[],
      sections:[]
      };
    },
    computed: {
      filteredItems() {
        let filteredItems = this.items;

        if (this.surnameFilter) {
          filteredItems = filteredItems.filter(
            (item) => item.lastname.toLowerCase().includes(this.surnameFilter.toLowerCase())
          );
        }
        if (this.firstnameFilter) {
          filteredItems = filteredItems.filter(
            (item) => item.firstname.toLowerCase().includes(this.firstnameFilter.toLowerCase())
          );
        }
        
        return filteredItems;

        
      },
      sectionsList() {
        return [...new Set(this.sections.map((item) => item.name))];
      },
    },
    methods:{
      async getUserByMembershipNumber(membershipNumber){
            this.loading = true;
      const URL = `https://chitma.hushsoft.co.zw/api/api/v1/auth/getUserByMembershipNumber/${membershipNumber}`;
      // const token = localStorage.token;
      await axios.get(URL,{
        headers: {'Content-Type': 'application/json',
            // Authorization : 'Bearer ' + token,
            'Access-Control-Allow-Origin': '*'}
      }).then((res) =>
       {
        this.account = res.data
        console.log(this.account);
        console.log("Information tatora baba.");
        this.editModal = true;
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },
      async getAllUsers(pageNumber){
      this.loading = true;
      Number.parseInt(pageNumber)
      pageNumber -=1;
      const pp = localStorage.getItem('pp');
      const local = decryptData(pp);
      const URL = `https://chitma.hushsoft.co.zw/api/api/v1/auth/getAllUsersAccounts/${pageNumber}/${local}`;
      // const URL = "https://chitma.hushsoft.co.zw/api/api/v1/auth/getAllNonAdminAccounts/${pageNumber}/${local}";
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
        console.log(this.pages)
        console.log("these are the items",this.items)
        console.log("Fetching Data Completed...");
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
      console.log("Munhu uyu",mbnD)
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
        openAddModal() {
          this.addModal = true;
        },
        closeAddModal() {
          this.addModal = false;
        },
        openEditModal() {
          this.editModal = true;
        },
        closeEditModal() {
          this.editModal = false;
        },
        openDeleteModal(membershipNumber) {
          this.deleteModal = true;
          this.membershipNumber = membershipNumber;
        },
        closeDeleteModal() {
          this.deleteModal = false;
        },
        exportExcel(){
          import("../../plugins/Export2Excel").then((excel) =>{
            const obj = this.items
            const HEADER = ["ID", "First Name", "Last Name", "Gender", "Date Of Birth","Organisation","Circuit","Locals","Section", "Membership Status","Role"];
            const field = ["id", "firstname", "lastname", "gender", "dateOfBirth", "organisation","circuit", "locals","section", "membershipStatus", "role"];
            const Data = this.FormatJson(field, obj)
            excel.export_json_to_excel({
              header:HEADER,
              data: Data,
              sheetName: "Name of sheets",
              filename:"Accounts",
              autoWidth:true,
              bookType:"xlsx"
            })
          })
       }, 
       FormatJson(FilterData, JsonData){
        return JsonData.map((v) =>FilterData.map((j => {
          if(j == "locals"){
            return v["locals"]["name"]
          }
          if(j == "circuit"){
            return v["circuit"]["name"]
          }
          if(j == "section"){
            return v["section"]["name"]
          }
          
          return v[j]
        })))
       }
       
    },
    mounted(){
      this.getAllUsers(1),
      this.getAdminInfo()
    }
  };
  </script>
  
  <style>
  
  </style>
  
  