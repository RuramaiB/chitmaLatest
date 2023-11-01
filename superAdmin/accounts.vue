<template>
    <div>
      <div class="flex px-10 py-1 bg-green-900">    
        <div class="flex flex-rows w-full justify-between">
          <div class="pl-1 py-2">
            <h1 class="text-xl font-semibold text-white">Accounts</h1>
          </div>
          <!-- Right content -->
          <div class="relative my-1 z-10">
          <button
            @click="isOpen = !isOpen"
            class="inline-flex items-center justify-center  font-bold text-md  text-white border-none"
            aria-expanded="false"
          >
            <!-- {{ Ruramai }} -->
            Ruramai
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
              <NuxtLink class=" text-black flex flex-cols text-md font-lg cursor-pointer my-3 gap-2" to=".././settings">
                <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 24 24"> <g> <path fill="none" d="M0 0h24v24H0z"/> <path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2a9.985 9.985 0 0 1 8 4h-2.71a8 8 0 1 0 .001 12h2.71A9.985 9.985 0 0 1 12 22zm7-6v-3h-8v-2h8V8l5 4-5 4z"/> </g> </svg>
                Logout
              </NuxtLink>
            </div>
          </div>
        </div>
          
        </div>
      </div> 
      <div class="mt-1 p-4 gap-3">
        <div class="bg-white rounded shadow-sm">
          <button class="text-black border-2 border-green-600 bg-white px-4 py-1 rounded-lg m-1" @click="openAddModal">Add</button>
          <button class="text-black border-2 border-green-600 bg-white px-4 py-1 rounded-lg m-1" @click="exportExcel">Export</button>
        </div>
        <div class="relative overflow-x-auto mb-5 shadow-md sm:rounded-lg">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
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
                              <td class="px-3 py-4">
                                <a href="#" class="font-medium text-green-500 dark:text-blue-500 hover:underline">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"  @click="getUserByMembershipNumber(item.membershipNumber)"  class="bi bi-pencil-square" viewBox="0 0 16 16"> <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/> <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/> </svg>
                                </a >
                              </td>
                              <td class="pl-3 pr-4 py-4">
                                <a href="#" class="font-medium text-yellow-500 dark:text-blue-500 hover:underline" >
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"  @click="openDeleteModal(item.membershipNumber)" class="bi bi-trash" viewBox="0 0 16 16"> <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/> <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/> </svg>
                                </a >
                              </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="text-md text-white flex flex-row justify-end bg-green-900 px-8 w-full">
                          <button class="p-3" @click="getAllUsers(pageNumber)"  v-for="pageNumber in this.result.totalPages" :key="pageNumber">
                            {{ pageNumber }} 
                          </button>
                    </div>
    </div>
                    <!-- Floating Download Button -->
                    <!-- <try/> -->
                    <!-- End of Floating button -->
                  <!--  Add Modal -->
                  <div v-if="addModal" class="z-10 pt-36 backdrop-brightness-50 top-0 w-screen h-screen absolute inset-0 flex items-center justify-center">
                        <div class="bg-white rounded-lg shadow-md p-5 overflow-y-auto">
                          <!-- Modal Content -->
                          <div class="flex justify-between">
                            <h2  class="text-2xl font-bold mb-4">{{ addModalHeading }}</h2>
                            <button class="bg-red-500 text-white text-xl font-xl px-3 py-1 mt-4 rounded-md" @click="closeAddModal">X</button>
                          </div>
                          <p v-if="loading">Processing the payment request</p>
                          <form  v-else @submit.prevent="AddNewUser()" class=" grid grid-cols-2 gap-12 bg-white shadow-md rounded px-8 py-6 mb-4">
                            <!-- First Name -->
                             <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="firstname">First Name:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="firstname" type="text" v-model="users.firstname" >
                                <p v-if="this.errors.firstname" class="text-sm text-red-600 text-left mb-2">*{{this.errors.firstname}}</p>
                            </div> 
                             <!-- Last Name -->
                             <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="local">Last Name:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="lastname" type="text" v-model="users.lastname" >
                                <p v-if="this.errors.lastname" class="text-sm text-red-600 text-left mb-2">*{{this.errors.lastname}}</p>
                            </div> 
                            <!-- Gender -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="gender">Gender</label>
                              <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="gender" v-model="users.gender" >
                                <option value="" disabled>Select Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                              </select>
                              <p v-if="this.errors.gender" class="text-sm text-red-600 text-left mb-2">*{{this.errors.gender}}</p>
                            </div>      
                            <!-- Date of Birth -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="dateOfBirth">Date of Birth:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="dateOfBirth" type="date" v-model="users.dateOfBirth" >
                                <p v-if="this.errors.dateOfBirth" class="text-sm text-red-600 text-left mb-2">*{{this.errors.dateOfBirth}}</p>
                            </div>  
                            <!-- Organisation -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="organisation">Organisation</label>
                              <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="organisation" v-model="users.organisation" >
                                <option value="" disabled>Select organisation</option>
                                <option value="UMYF">UMYF</option>
                                <option value="RRW">RRW</option>
                                <option value="JSS">JSS</option>
                                <option value="MUMC">MUMC</option>
                              </select>
                              <p v-if="this.errors.organisation" class="text-sm text-red-600 text-left mb-2">*{{this.errors.organisation}}</p>
                            </div>
                            <!-- Membership Status -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="membershipStatus">Membership Status</label>
                              <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="membershipStatus" v-model="users.membershipStatus" >
                                <option value="" disabled>Select Membership Status</option>
                                <option value="Full">Full</option>
                                <option value="Probational">Probational</option>
                              </select>
                              <p v-if="this.errors.membershipStatus" class="text-sm text-red-600 text-left mb-2">*{{this.errors.membershipStatus}}</p>
                            </div>
                            <!-- Section -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="section">Section:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="section" type="text" v-model="users.section" >
                                <p v-if="this.errors.section" class="text-sm text-red-600 text-left mb-2">*{{this.errors.section}}</p>
                            </div> 
                             
                             <!-- Role -->
                             <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="role">Local</label>
                              <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="role" v-model="users.locals" >
                                <option value="" disabled>Select Local</option>
                                <option value="St Andrews">St Andrews</option>
                                <option value="Sunnyside">Sunnyside</option>
                                <option value="Ebenezer">Ebenezer</option>
                              </select>
                              <p v-if="this.errors.locals" class="text-sm text-red-600 text-left mb-2">*{{this.errors.locals}}</p>
                            </div> 
                            <!-- Password -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="password">Password:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="password" type="password" v-model="users.password" >
                                <p v-if="this.errors.password" class="text-sm text-red-600 text-left mb-2">*{{this.errors.password}}</p>
                            </div>
                            <!-- Confirm Password -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="cpassword">Confirm Password:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="cpassword" type="password" v-model="users.cpassword" >
                                <p v-if="this.errors.cpassword" class="text-sm text-red-600 text-left mb-2">*{{this.errors.cpassword}}</p>
                            </div>
                            <!-- Submit Button -->
                            <div class="ml-2">
                              <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" 
                              >Submit</button>
                            </div>
                          </form>        
                        </div>
                      </div>
                      <!-- End of Add modal -->
                <div v-if="editModal" class="z-10 ml-40 pt-24 backdrop-brightness-50 top-0 w-screen h-screen absolute inset-0 flex items-center justify-center">
                  <div class="bg-white rounded-lg shadow-md p-5 overflow-y-auto">
                    <!-- Modal Content -->
                    <div class="flex justify-between">
                      <h2 class="text-2xl font-bold mb-4">{{ editModalHeading }}</h2>
                      <button class="bg-red-500 text-white text-xl font-xl px-3 py-1 mt-4 rounded-md" @click="closeEditModal">X</button>
                    </div>
                    <form @submit.prevent="updateUser(account.membershipNumber)" class=" grid grid-cols-3 gap-12 bg-white shadow-md rounded px-8 py-6 mb-4">
                      <!-- First Name -->
                      <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="firstname">First Name:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="firstname" type="text" v-model="account.firstname" >
                                <p v-if="this.errors.firstname" class="text-sm text-red-600 text-left mb-2">*{{this.errors.firstname}}</p>
                            </div> 
                             <!-- Last Name -->
                             <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="local">Last Name:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="lastname" type="text" v-model="account.lastname" >
                                <p v-if="this.errors.lastname" class="text-sm text-red-600 text-left mb-2">*{{this.errors.lastname}}</p>
                            </div> 
                            <!-- Gender -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="gender">Gender</label>
                              <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="gender" v-model="account.gender" >
                                <option value="" disabled>Select Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                              </select>
                              <p v-if="this.errors.gender" class="text-sm text-red-600 text-left mb-2">*{{this.errors.gender}}</p>
                            </div>      
                            <!-- Date of Birth -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="dateOfBirth">Date of Birth:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="dateOfBirth" type="date" v-model="account.dateOfBirth" >
                                <p v-if="this.errors.dateOfBirth" class="text-sm text-red-600 text-left mb-2">*{{this.errors.dateOfBirth}}</p>
                            </div>  
                            <!-- Organisation -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="organisation">Organisation</label>
                              <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="organisation" v-model="account.organisation" >
                                <option value="" disabled>Select organisation</option>
                                <option value="UMYF">UMYF</option>
                                <option value="RRW">RRW</option>
                                <option value="JSS">JSS</option>
                                <option value="MUMC">MUMC</option>
                              </select>
                              <p v-if="this.errors.organisation" class="text-sm text-red-600 text-left mb-2">*{{this.errors.organisation}}</p>
                            </div>
                            <!-- Membership Status -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="membershipStatus">Membership Status</label>
                              <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="membershipStatus" v-model="account.membershipStatus" >
                                <option value="" disabled>Select Membership Status</option>
                                <option value="Full">Full</option>
                                <option value="Probational">Probational</option>
                              </select>
                              <p v-if="this.errors.membershipStatus" class="text-sm text-red-600 text-left mb-2">*{{this.errors.membershipStatus}}</p>
                            </div>
                             
                            <!-- Section -->
                            <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="section">Section:</label>
                              <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="section" type="text" v-model="account.section.name" >
                                <p v-if="this.errors.section" class="text-sm text-red-600 text-left mb-2">*{{this.errors.section}}</p>
                            </div> 
                             
                             <!-- Role -->
                             <div class="mb-4">
                              <label class="block text-gray-700 text-sm font-bold mb-2" for="role">Role</label>
                              <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                id="role" v-model="account.role" >
                                <option value="" disabled>Select Role</option>
                                <option value="User">User</option>
                                <option value="Finance">Finance</option>
                                <option value="Admin">Admin</option>
                              </select>
                              <p v-if="this.errors.role" class="text-sm text-red-600 text-left mb-2">*{{this.errors.role}}</p>
                            </div> 
                            
                      <div class="ml-2">
                        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" 
                          type="submit">Submit</button>
                      </div>
                    </form>       
                  </div>
                </div>
                <div v-if="deleteModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-10">
                  <div class="bg-white p-6 rounded-lg">
                    <p class="mb-4">Are you sure you want to delete?</p>
                    <div class="flex justify-end">
                      <button class="mr-2 px-4 py-2 bg-red-500 hover:bg-red-600 text-white rounded" @click="handleOption('yes')">Yes</button>
                      <button
                        class="px-4 py-2 bg-gray-300 hover:bg-gray-400 text-gray-800 rounded" @click="handleOption('no')">No</button>
                    </div>
                  </div>
                </div>
               
      </div>  
    </div>
      
  </template>
  
  <script>
  import axios from 'axios'
  export default {
    data() {
      return {
        sectionFilter: '',
        surnameFilter: '',
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
          locals: "",
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
      async AddNewUser(){
        this.errors = {};
               if(!this.users.firstname){
                   this.errors.firstname = "First name is required";
               }
               if(!this.users.lastname){
                   this.errors.lastname = "Last name is required";
               }
               if(!this.users.dateOfBirth){
                   this.errors.dateOfBirth = "Date Of Birth is required";
               }
               if(!this.users.gender){
                   this.errors.gender = "Gender is required";
               }
               if(!this.users.locals){
                   this.errors.locals = "Local is required";
               }
               if(!this.users.organisation){
                   this.errors.organisation = "Organisation is required";
               }
               if(!this.users.membershipStatus){
                   this.errors.membershipStatus = "Membership Status is required";
               }
               if(!this.users.section){
                   this.errors.section = "Section is required";
               } 
               if(!this.users.password){
                   this.errors.password = "Enter password";
               } 
               if(!(this.users.password === this.users.cpassword)){
                   this.errors.cpassword = "Passwords do not match";
               }
               if(!this.users.cpassword){
                   this.errors.cpassword = "Re-enter password";
               } 
             
              if (Object.keys(this.errors).length === 0) {
          // make API call or submit form data here
          try{
            const local = localStorage.local
          await axios.post('https://chitma.hushsoft.co.zw/api/api/v1/auth/register',{
            'firstname': this.users.firstname,  
            'lastname': this.users.lastname,  
            'gender': this.users.gender,  
            'dateOfBirth': this.users.dateOfBirth,  
            'role': "Admin",  
            'organisation': this.users.organisation,  
            'membershipStatus': this.users.membershipStatus,  
            'section': this.users.section, 
            'password': this.users.password,   
            'local': this.users.locals,
          },{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("User added successfully.")
            this.response = data;
            console.log(response);
          })
          }catch(err){
          console.log("Error:",err)
          this.errors.failed = "Sorry, an error occured!";
          this.errors.ERR = err;
          }
          console.log("Form submitted successfully");
        }
      },
      async getAllUsers(pageNumber){
      this.loading = true;
      Number.parseInt(pageNumber)
      pageNumber -=1;
      const local = localStorage.local;
      const URL = `https://chitma.hushsoft.co.zw/api/api/v1/auth/getAllAdminAccounts/${pageNumber}`;
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
        console.log(this.items)
        console.log("Fetching Data Completed...");
      }) .catch(error => {
        console.log(error.code)
        this.error=error.code;
        this.errored = true
  
      }).finally(() => this.loading = false);
      },  
      async updateUser(membershipNumber){
        this.errors = {};
               if(!this.account.firstname){
                   this.errors.firstname = "First name is required";
               }
               if(!this.account.lastname){
                   this.errors.lastname = "Last name is required";
               }
               if(!this.account.dateOfBirth){
                   this.errors.dateOfBirth = "Date Of Birth is required";
               }
               if(!this.account.gender){
                   this.errors.gender = "Gender is required";
               }
               if(!this.account.role){
                   this.errors.role = "Role is required";
               }
               if(!this.account.organisation){
                   this.errors.organisation = "Organisation is required";
               }
               if(!this.account.membershipStatus){
                   this.errors.membershipStatus = "Membership Status is required";
               }
               if(!this.account.section){
                   this.errors.section = "Section is required";
               }            
              if (Object.keys(this.errors).length === 0) {
          // make API call or submit form data here
          try{
            const local = localStorage.local
          await axios.put('https://chitma.hushsoft.co.zw/api/api/v1/auth/updateUserByMembershipNumber/' + membershipNumber,{
            'firstname': this.account.firstname,  
            'lastname': this.account.lastname,  
            'gender': this.account.gender,  
            'dateOfBirth': this.account.dateOfBirth,  
            'role': this.account.role,  
            'organisation': this.account.organisation,  
            'membershipStatus': this.account.membershipStatus,  
            'section': this.account.section.name, 
            'local': local,
          },{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("User updated successfully.")
            this.response = data;
            console.log(response);
          })
          }catch(err){
          console.log("Error:",err)
          this.errors.failed = "Sorry, an error occured!";
          this.errors.ERR = err;
          }
          console.log("Form submitted successfully");
        }
      },
     async handleOption (_option) {
        if(_option = 'yes'){
          try{
          await axios.delete('https://chitma.hushsoft.co.zw/api/api/v1/auth/deleteUserByMembershipNumber/' + this.membershipNumber,{
              headers: {'Content-Type': 'application/json'},
              credentials: 'include'
            }).then((response) =>{
            const data = response.data;
            alert("Local Finance Record deleted successfully.")
            this.closeDeleteModal()
            this.response = data;
            console.log(response);
          })
          }catch(err){
          console.log("Error:",err)
          this.errors.failed = "Sorry, an error occured!";
          this.errors.ERR = err;
          }
          console.log("Form submitted successfully");
      }
      else if(_option = 'no'){
        this.name = ''
        this.closeDeleteModal();
      } 
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
      this.getAllUsers(1)
    }
  };
  </script>
  
  <style>
  
  </style>
  
  