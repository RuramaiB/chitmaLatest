<template>
     <NuxtLayout name="finance-layout">
      <div class="flex px-10 py-1 bg-blue-900">    
        <div class="flex flex-rows w-full justify-between">
          <div class="pl-1 py-2">
            <h1 class="text-xl font-semibold text-white">Reporting</h1>
          </div>
          <!-- Right content -->
          <div class="relative my-1 z-10">
          <button
            @click="isOpen = !isOpen"
            class="inline-flex items-center justify-center  font-bold text-md  text-white border-none"
            aria-expanded="false"
          >
            <!-- {{ account.username }} -->
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
      <div class="w-full p-5">
      <div class="shadow-lg bg-white rounded-lg overflow-hidden">
          <div class="p-4 bg-blue-900 flex items-center justify-between">
              <h2 class="text-white text-lg font-bold">Local Finance Reports</h2>
              <button
                  @click="localFinanceToggle()"
                  class="text-gray-300 focus:outline-none focus:text-gray-400"
              >
                  <svg
                      :class="{'hidden': isLocalFinanceOpen, 'block': !isLocalFinanceOpen }"
                      class="h-6 w-6 fill-current"
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                  >
                      <path
                          d="M4.929 7.757l1.414-1.414L12 11.172l5.657-5.657l1.414 1.414L12 14l-7.071-7.071z"
                      />
                  </svg>
                  <svg
                      :class="{'hidden': !isLocalFinanceOpen, 'block': isLocalFinanceOpen }"
                      class="h-6 w-6 fill-current"
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                  >
                      <path
                          d="M19.071 16.243l-1.414 1.414L12 12.828l-5.657 5.657l-1.414-1.414L10.586 12L4.929 6.343l1.414-1.414L12 10.828l5.657-5.657l1.414 1.414L13.414 12l5.657 5.657z"
                      />
                  </svg>
              </button>
          </div>
          <div :class="!isLocalFinanceOpen ? 'hidden': ''" class="px-4 py-2">
              <div class="w-full">
                <ul>
                  
                  <ol>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all local finance records
                      <p class="text-sm italic font-semibold">This function generates all the local finance records.</p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all local finance (Cash)
                      <p class="text-sm italic font-semibold">This function generates all the local finance records paid by cash only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all local finance (EcoCash)
                      <p class="text-sm italic font-semibold">This function generates all the local finance records paid by EcoCash only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all local finance (Bank)
                      <p class="text-sm italic font-semibold">This function generates all the local finance records paid by bank only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    
                  </ol>
                </ul>
              </div>
          </div>
      </div>
      </div>
      <div class="w-full p-5">
      <div class="shadow-lg bg-white rounded-lg overflow-hidden">
          <div class="p-4 bg-blue-900 flex items-center justify-between">
              <h2 class="text-white text-lg font-bold">Section Finance Reports</h2>
              <button
                  @click="sectionFinanceToggle"
                  class="text-gray-300 focus:outline-none focus:text-gray-400"
              >
                  <svg
                      :class="{'hidden': isSectionFinanceOpen, 'block': !isSectionFinanceOpen }"
                      class="h-6 w-6 fill-current "
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                  >
                      <path
                          d="M4.929 7.757l1.414-1.414L12 11.172l5.657-5.657l1.414 1.414L12 14l-7.071-7.071z"
                      />
                  </svg>
                  <svg
                      :class="{'hidden': !isSectionFinanceOpen, 'block': isSectionFinanceOpen }"
                      class="h-6 w-6 fill-current text-white"
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                  >
                      <path
                          d="M19.071 16.243l-1.414 1.414L12 12.828l-5.657 5.657l-1.414-1.414L10.586 12L4.929 6.343l1.414-1.414L12 10.828l5.657-5.657l1.414 1.414L13.414 12l5.657 5.657z"
                      />
                  </svg>
              </button>
          </div>
          <div :class="{'hidden': !isSectionFinanceOpen }" class="px-4 py-2">
              <div class="w-full">
                <ul>
                  
                  <ol>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all section finance records
                      <p class="text-sm italic font-semibold">This function generates all the section finance records.</p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all section finance (Cash)
                      <p class="text-sm italic font-semibold">This function generates all the section finance records paid by cash only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all section finance (EcoCash)
                      <p class="text-sm italic font-semibold">This function generates all the section finance records paid by EcoCash only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all section finance (Bank)
                      <p class="text-sm italic font-semibold">This function generates all the section finance records paid by bank only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    
                  </ol>
                </ul>
              </div>
          </div>
      </div>
      </div>
      <div class="w-full p-5">
      <div class="shadow-lg bg-white rounded-lg overflow-hidden">
          <div class="p-4 bg-blue-900 flex items-center justify-between">
              <h2 class="text-white text-lg font-bold">Organisation Finance Reports</h2>
              <button
                  @click="organisationFinanceToggle"
                  class="text-gray-300 focus:outline-none focus:text-gray-400"
              >
                  <svg
                      :class="{'hidden': isOrganisationFinanceOpen, 'block': !isOrganisationFinanceOpen }"
                      class="h-6 w-6 fill-current "
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                  >
                      <path
                          d="M4.929 7.757l1.414-1.414L12 11.172l5.657-5.657l1.414 1.414L12 14l-7.071-7.071z"
                      />
                  </svg>
                  <svg
                      :class="{'hidden': !isOrganisationFinanceOpen, 'block': isOrganisationFinanceOpen }"
                      class="h-6 w-6 fill-current text-white"
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                  >
                      <path
                          d="M19.071 16.243l-1.414 1.414L12 12.828l-5.657 5.657l-1.414-1.414L10.586 12L4.929 6.343l1.414-1.414L12 10.828l5.657-5.657l1.414 1.414L13.414 12l5.657 5.657z"
                      />
                  </svg>
              </button>
          </div>
          <div :class="{'hidden': !isOrganisationFinanceOpen }" class="px-4 py-2">
              <div class="w-full">
                <ul>
                  
                  <ol>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all organisations finance records
                      <p class="text-sm italic font-semibold">This function generates all the organisations finance records.</p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all organisations finance (Cash)
                      <p class="text-sm italic font-semibold">This function generates all the organisations finance records paid by cash only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all organisations finance (EcoCash)
                      <p class="text-sm italic font-semibold">This function generates all the organisations finance records paid by EcoCash only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all organisations finance (Bank)
                      <p class="text-sm italic font-semibold">This function generates all the organisations finance records paid by bank only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    
                  </ol>
                </ul>
              </div>
          </div>
      </div>
      </div>
      <div class="w-full p-5">
      <div class="shadow-lg bg-white rounded-lg overflow-hidden">
          <div class="p-4 bg-blue-900 flex items-center justify-between">
              <h2 class="text-white text-lg font-bold">Pledges Reports</h2>
              <button
                  @click="pledgesToggle"
                  class="text-gray-300 focus:outline-none focus:text-gray-400"
              >
                  <svg
                      :class="{'hidden': isPledgesOpen, 'block': !isPledgesOpen }"
                      class="h-6 w-6 fill-current "
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                  >
                      <path
                          d="M4.929 7.757l1.414-1.414L12 11.172l5.657-5.657l1.414 1.414L12 14l-7.071-7.071z"
                      />
                  </svg>
                  <svg
                      :class="{'hidden': !isPledgesOpen, 'block': isPledgesOpen }"
                      class="h-6 w-6 fill-current text-white"
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                  >
                      <path
                          d="M19.071 16.243l-1.414 1.414L12 12.828l-5.657 5.657l-1.414-1.414L10.586 12L4.929 6.343l1.414-1.414L12 10.828l5.657-5.657l1.414 1.414L13.414 12l5.657 5.657z"
                      />
                  </svg>
              </button>
          </div>
          <div :class="{'hidden': !isPledgesOpen }" class="px-4 py-2">
              <div class="w-full">
                <ul>
                  
                  <ol>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all pledges records
                      <p class="text-sm italic font-semibold">This function generates all the pledges records.</p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all pledges (Cash)
                      <p class="text-sm italic font-semibold">This function generates all the pledges records paid by cash only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all pledges (EcoCash)
                      <p class="text-sm italic font-semibold">This function generates all the pledges records paid by EcoCash only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    <li class="flex justify-between text-gray-800 text-md font-semibold my-1 hover:bg-gray-50 rounded-md p-2">Get all pledges (Bank)
                      <p class="text-sm italic font-semibold">This function generates all the pledges records paid by bank only. </p>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16"> <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/> </svg>
                    </li>
                    
                  </ol>
                </ul>
              </div>
          </div>
      </div>
      </div>
  </NuxtLayout>
</template>
  
  <script setup>
  const isLocalFinanceOpen = ref(false)
  const isSectionFinanceOpen = ref(false)
  const isOrganisationFinanceOpen = ref(false)
  const isPledgesOpen = ref(false)
    function localFinanceToggle() {
      isLocalFinanceOpen.value = !isLocalFinanceOpen.value;
    }
    function sectionFinanceToggle() {
          isSectionFinanceOpen.value = !isSectionFinanceOpen.value;
    }
    function organisationFinanceToggle() {
          isOrganisationFinanceOpen.value = !isOrganisationFinanceOpen.value;
    }
    function pledgesToggle() {
          isPledgesOpen.value = !isPledgesOpen.value;
    }
    
  </script>
  
  <style>
  
  </style>