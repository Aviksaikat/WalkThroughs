
/* WARNING: Could not reconcile some variable overlaps */

undefined8 ftpmain(void)

{
  int __fd;
  uint uVar1;
  int iVar2;
  int *__ptr;
  ulong uVar3;
  int *__arg;
  long in_FS_OFFSET;
  int local_68;
  socklen_t local_64;
  pthread_t local_60;
  sockaddr local_58;
  long local_40;
  
  local_40 = *(long *)(in_FS_OFFSET + 0x28);
  __fd = socket(2,1,6);
  if (__fd == -1) {
    __printf_chk(1,"\r\n socket create error\r\n");
  }
  else {
    local_68 = 1;
    setsockopt(__fd,1,2,&local_68,4);
    __ptr = (int *)x_malloc((ulong)g_cfg._8_4_ << 2);
    if (g_cfg._8_4_ != 0) {
      uVar1 = 0;
      do {
        uVar3 = (ulong)uVar1;
        uVar1 = uVar1 + 1;
        __ptr[uVar3] = -1;
      } while (uVar1 < g_cfg._8_4_);
    }
    local_58 = (sockaddr)CONCAT142((undefined  [14])local_58.sa_data,2);
    local_58 = (sockaddr)((undefined  [16])local_58 & (undefined  [16])0xffffffffffffffff);
    iVar2 = bind(__fd,&local_58,0x10);
    if (iVar2 == 0) {
      writelogentry(0,"220 LightFTP server ready\r\n","");
      iVar2 = listen(__fd,0x1000);
      if (iVar2 == 0) {
LAB_0010af20:
        do {
          do {
            local_64 = 0x10;
            local_58 = (sockaddr)0x0;
            iVar2 = accept(__fd,&local_58,&local_64);
          } while (iVar2 == -1);
          local_68 = -1;
          if (g_cfg._8_4_ != 0) {
            __arg = __ptr;
            do {
              if (*__arg == -1) {
                if (g_cfg._12_4_ != 0) {
                  socket_set_keepalive(iVar2);
                }
                *__arg = iVar2;
                local_68 = pthread_create(&local_60,(pthread_attr_t *)0x0,ftp_client_thread,__arg);
                if ((local_68 == 0) || (*__arg = -1, local_68 == 0)) goto LAB_0010af20;
                break;
              }
              __arg = __arg + 1;
            } while (__arg != __ptr + g_cfg._8_4_);
          }
          send(iVar2,"MAXIMUM ALLOWED USERS CONNECTED\r\n",0x21,0x4000);
          close(iVar2);
        } while( true );
      }
      free(__ptr);
      close(__fd);
    }
    else {
      __printf_chk(1,"\r\n Failed to start server. Can not bind to address\r\n\r\n");
      free(__ptr);
      close(__fd);
    }
  }
  if (local_40 == *(long *)(in_FS_OFFSET + 0x28)) {
    return 0;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail();
}

