Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E49142680B2
	for <lists+nouveau@lfdr.de>; Sun, 13 Sep 2020 20:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A372C89C59;
	Sun, 13 Sep 2020 18:14:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE9889C59
 for <nouveau@lists.freedesktop.org>; Sun, 13 Sep 2020 18:14:11 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id l1so4760965uai.3
 for <nouveau@lists.freedesktop.org>; Sun, 13 Sep 2020 11:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=R03rExbP1mMvelifeojEce96AexFISWFkbFcikH5rs4=;
 b=KdAXQJoxV48AoTWdY00H54FaKmj6lzwhcVJBkpznbRXGnbfgv/PwhoHaTbnOzpw5Ox
 bXOAE/hEfOTLSWkGH43zB20iY5pv0C/NEpMyiD619k4XTk/NSnvnqXFyHXVN+vqImadg
 OmIx1m3KRQBBA293JhI9m4wChExmpTaF00WAstyPN2c2PlzK0t2goooTw0FAHxpI0suq
 b35Rc8ctspWTvChnedWGLMKV0DdYu2N6zBhSr82AWKbalIfnu2b8DlpBShZdjfvioUQu
 reMU20sFBdmU4nUSiW+dPBU46VrrOsE2cHcFHbvn+utOY5HT+DACfhXhkDzsTX98VW39
 HqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=R03rExbP1mMvelifeojEce96AexFISWFkbFcikH5rs4=;
 b=eZ0Wn+JuF2XZncBjuw4Y7LkScqam9aLK8+iy8ZIYQNpDQgoHT18HJvVQj+wDfi5Z2J
 Y63YXFuJm604rCiC0yoSHhmiT8NniE3diWI9mqWQjn8j5rrqpOUIynGjDiDd08JSpy9l
 hzWwvD9iVGqG7mvPRLxMeYqis16/4ByOyjomM0igOTH2gZQlPzCz63TEAQjj8vI0ATw3
 6huHiWAvraB1ltJCCafZ3EsnmgukAD8GgJYze0VWFUYqNFzM7ZK8qoSpfvxP107BKpIn
 y9II0cQxJCKbjYMIkB3q192gRW9sdkS5CBtCkTx4anoTJp6rh1TqCOx+YIrN1IfP0Dzp
 hm/g==
X-Gm-Message-State: AOAM5339jsZQNLKYuW0kkRGJ7k5KFjhoT8iEKi6zpD7s1JbdB3e/vlLa
 SnnPdRZOxSt36PMFfQn6tWSqhCZ9efaEawiKS0UsKxJC3DI=
X-Google-Smtp-Source: ABdhPJw7XmW6eDSpjtnTTtgmeGPCTO+4NVX0DBiIvzWxWKJGi6l7/tBjTlvZuR5LOC3XMf6hnFp+ynzxYuZ0K7P+6Ms=
X-Received: by 2002:ab0:145:: with SMTP id 63mr3327977uak.83.1600020850273;
 Sun, 13 Sep 2020 11:14:10 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Tomasz_K=C5=82oczko?= <kloczko.tomasz@gmail.com>
Date: Sun, 13 Sep 2020 19:13:44 +0100
Message-ID: <CABB28CwNaHhCdKZio-GoGWcmTyZ-B33zwnmMmhQ9JLy8EjhC-Q@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [Nouveau] libva-utils test siuite is crashing in nouveau sriver
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1492228403=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1492228403==
Content-Type: multipart/alternative; boundary="00000000000069f76405af35e231"

--00000000000069f76405af35e231
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm hitting that issue since Mesa 20.0.6 and it is present still in latest
version 20.1.7

```
[tkloczko@barrel SPECS]$ coredumpctl gdb 3926866
           PID: 3926866 (test_va_api)
           UID: 1000 (tkloczko)
           GID: 1000 (tkloczko)
        Signal: 11 (SEGV)
     Timestamp: Sun 2020-09-13 18:57:06 BST (32s ago)
  Command Line: ./test_va_api
    Executable:
/home/tkloczko/rpmbuild/BUILD/libva-utils-2.9.0/test/test_va_api
 Control Group: /user.slice/user-1000.slice/session-297.scope
          Unit: session-297.scope
         Slice: user-1000.slice
       Session: 297
     Owner UID: 1000 (tkloczko)
       Boot ID: ab9d350c623e4313bacb892de46b85f9
    Machine ID: d033f66b249a4ec09acfa81ac205554f
      Hostname: barrel
       Storage:
/var/lib/systemd/coredump/core.test_va_api.1000.ab9d350c623e4313bacb892de46=
b85f9.3926866.1600019826000000.zst
       Message: Process 3926866 (test_va_api) of user 1000 dumped core.

                Stack trace of thread 3926866:
                #0  0x00007f4e2d3fb6d2 vlVaCreateContext
(nouveau_drv_video.so + 0xb16d2)
                #1  0x00007f4e2e32d0f7 vaCreateContext (libva.so.2 +
0x190f7)
                #2  0x000055b48d29a419 n/a
(/home/tkloczko/rpmbuild/BUILD/libva-utils-2.9.0/test/test_va_api + 0x4e419=
)

GNU gdb (GDB) Fedora 9.0.50.20191119-2.fc32
Copyright (C) 2019 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l
>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-redhat-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from
/home/tkloczko/rpmbuild/BUILD/libva-utils-2.9.0/test/test_va_api...
[New LWP 3926866]
[New LWP 3926903]
[New LWP 3926906]
[New LWP 3926905]
[New LWP 3926904]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
Core was generated by `./test_va_api'.
Program terminated with signal SIGSEGV, Segmentation fault.
#0  vlVaCreateContext (ctx=3D<optimized out>, config_id=3D4294967295,
picture_width=3D1920, picture_height=3D1080, flag=3D1, render_targets=3D0x0=
,
num_render_targets=3D0, context_id=3D0x55b48e39c458)
    at ../src/gallium/state_trackers/va/context.c:229
229     ../src/gallium/state_trackers/va/context.c: No such file or
directory.
[Current thread is 1 (Thread 0x7f4e2ddbf4c0 (LWP 3926866))]
 elfutils-libelf-0.181-2.fc34.x86_64 expat-2.2.9-2.2.fc34.x86_64
glibc-2.32.9000-5.fc34.x86_64 gmp-6.2.0-5.fc33.x86_64
libX11-1.6.12-2.fc34.x86_64 libX11-xcb-1.6.12-2.fc34.x86_64
libXau-1.0.9-5.fc33.x86_64 libXdmcp-1.1.3-5.fc33.x86_64
libdrm-2.4.102-3.fc34.x86_64 libedit-3.1-34.20191231cvs.fc34.x86_64
libffi-3.2.1-2.3.fc32.x86_64 libgcc-10.2.1-3.fc34.x86_64
libstdc++-10.2.1-3.fc34.x86_64 libva-2.9.0-2.fc34.x86_64
libxcb-1.14-6.fc34.x86_64 libxml2-2.9.10-8.fc34.x86_64
libxshmfence-1.3-8.fc33.x86_64 libzstd-1.4.5-7.fc34.x86_64
llvm-libs-10.0.1-2.1.fc34.x86_64 ncurses-libs-6.2-4.20200817.fc34.x86_64
sssd-client-2.3.0-2.fc33.x86_64 xz-libs-5.2.5-4.fc33.x86_64
z3-libs-4.8.8-5.fc33.x86_64 zlib-1.2.11-23.fc33.x86_64
(gdb) bt full
Missing separate debuginfos, use: dnf debuginfo-install#0
 vlVaCreateContext (ctx=3D<optimized out>, config_id=3D4294967295,
picture_width=3D1920, picture_height=3D1080, flag=3D1, render_targets=3D0x0=
,
num_render_targets=3D0, context_id=3D0x55b48e39c458)
    at ../src/gallium/state_trackers/va/context.c:229
        drv =3D 0x55b48e398280
        context =3D <optimized out>
        config =3D 0x0
        is_vpp =3D <optimized out>
#1  0x00007f4e2e32d0f7 in vaCreateContext () from /lib64/libva.so.2
No symbol table info available.
#2  0x000055b48d29a419 in VAAPI::VAAPIFixture::doCreateContext
(this=3D<optimized out>, resolution=3D..., expectation=3D@0x7ffea3f6e468: 4=
) at
test_va_api_fixture.cpp:436
        gtest_ar =3D {success_ =3D 32, message_ =3D {ptr_ =3D 0xebe6e1ca084=
a2300}}
#3  0x000055b48d29ed34 in
VAAPI::VAAPICreateContextToFail_CreateContextWithNoConfig_Test::TestBody
(this=3D0x55b48e39c430) at test_utils.h:36
No locals.
#4  0x000055b48d296e23 in testing::Test::Run (this=3D0x55b48e39c430) at
../test/gtest/src/gtest.cc:2474
        impl =3D 0x55b48d91af60
        impl =3D <optimized out>
#5  testing::Test::Run (this=3D0x55b48e39c430) at
../test/gtest/src/gtest.cc:2465
        impl =3D <optimized out>
        impl =3D <optimized out>
#6  testing::TestInfo::Run (this=3D0x55b48d91fe00) at
../test/gtest/src/gtest.cc:2656
        impl =3D 0x55b48d91af60
        repeater =3D 0x55b48d91add0
        start =3D 1600019826817
        test =3D 0x55b48e39c430
        impl =3D <optimized out>
        repeater =3D <optimized out>
        start =3D <optimized out>
        test =3D <optimized out>
#7  testing::TestInfo::Run (this=3D0x55b48d91fe00) at
../test/gtest/src/gtest.cc:2630
        impl =3D <optimized out>
        repeater =3D <optimized out>
        start =3D <optimized out>
        test =3D <optimized out>
        impl =3D <optimized out>
        repeater =3D <optimized out>
        start =3D <optimized out>
        test =3D <optimized out>
#8  testing::TestCase::Run (this=3D0x55b48d9227d0) at
../test/gtest/src/gtest.cc:2774
        i =3D 0
        impl =3D 0x55b48d91af60
        repeater =3D 0x55b48d91add0
        start =3D 1600019826817
        impl =3D <optimized out>
        repeater =3D <optimized out>
        start =3D <optimized out>
        i =3D <optimized out>
#9  testing::TestCase::Run (this=3D0x55b48d9227d0) at
../test/gtest/src/gtest.cc:2759
        impl =3D <optimized out>
        repeater =3D <optimized out>
        start =3D <optimized out>
        impl =3D <optimized out>
        repeater =3D <optimized out>
        start =3D <optimized out>
        i =3D <optimized out>
#10 testing::internal::UnitTestImpl::RunAllTests (this=3D<optimized out>) a=
t
../test/gtest/src/gtest.cc:4649
        test_index =3D 4
        start =3D 1600019826482
        i =3D 0
        should_shard =3D <optimized out>
        has_tests_to_run =3D true
        repeater =3D 0x55b48d91add0
        forever =3D <optimized out>
        in_subprocess_for_death_test =3D <optimized out>
--Type <RET> for more, q to quit, c to continue without paging--
        failed =3D false
        repeat =3D <optimized out>
        in_subprocess_for_death_test =3D <optimized out>
        should_shard =3D <optimized out>
        has_tests_to_run =3D <optimized out>
        failed =3D <optimized out>
        repeater =3D <optimized out>
        repeat =3D <optimized out>
        forever =3D <optimized out>
        i =3D <optimized out>
        start =3D <optimized out>
        test_index =3D <optimized out>
#11 testing::internal::UnitTestImpl::RunAllTests (this=3D<optimized out>) a=
t
../test/gtest/src/gtest.cc:4551
        in_subprocess_for_death_test =3D <optimized out>
        should_shard =3D <optimized out>
        has_tests_to_run =3D <optimized out>
        failed =3D <optimized out>
        repeater =3D <optimized out>
        repeat =3D <optimized out>
        forever =3D <optimized out>
        i =3D <optimized out>
        start =3D <optimized out>
        test_index =3D <optimized out>
#12 0x000055b48d265179 in
testing::internal::HandleExceptionsInMethodIfSupported<testing::internal::U=
nitTestImpl,
bool> (location=3D<synthetic pointer>,
    method=3D(bool
(testing::internal::UnitTestImpl::*)(testing::internal::UnitTestImpl *
const)) 0x55b48d295c20 <testing::internal::UnitTestImpl::RunAllTests()>,
object=3D0x55b48d91af60)
    at ../test/gtest/src/gtest.cc:2410
No locals.
#13 testing::UnitTest::Run (this=3D0x55b48d2bb340
<testing::UnitTest::GetInstance()::instance>) at
../test/gtest/src/gtest.cc:4257
        in_death_test_child_process =3D <optimized out>
        premature_exit_file =3D <optimized out>
        in_death_test_child_process =3D <optimized out>
        premature_exit_file =3D <optimized out>
#14 RUN_ALL_TESTS () at ../test/gtest/include/gtest/gtest.h:2233
No locals.
#15 main (argc=3D<optimized out>, argv=3D0x7ffea3f6e798) at test_main.cpp:3=
1
No locals.
(gdb)
```

Any help/hints about what I can do to help diagnose that issue?

kloczek
--=20
Tomasz K=C5=82oczko | LinkedIn: *http://lnkd.in/FXPWxH <http://lnkd.in/FXPW=
xH>*

--00000000000069f76405af35e231
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">Hi,</div><div class=3D"gmail_default" style=3D"font-family:mon=
ospace,monospace"><br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:monospace,monospace">I&#39;m hitting that issue since Mesa 20.0.6 and it=
 is present still in latest version=C2=A020.1.7</div><div class=3D"gmail_de=
fault" style=3D"font-family:monospace,monospace"><br></div><div class=3D"gm=
ail_default" style=3D"font-family:monospace,monospace">```</div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace">[tkloczko@barr=
el SPECS]$ coredumpctl gdb 3926866<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0PID: 3926866 (test_va_api)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0UID: 1000 (tkloczko)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GID: 10=
00 (tkloczko)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Signal: 11 (SEGV)<br>=C2=A0 =
=C2=A0 =C2=A0Timestamp: Sun 2020-09-13 18:57:06 BST (32s ago)<br>=C2=A0 Com=
mand Line: ./test_va_api<br>=C2=A0 =C2=A0 Executable: /home/tkloczko/rpmbui=
ld/BUILD/libva-utils-2.9.0/test/test_va_api<br>=C2=A0Control Group: /user.s=
lice/user-1000.slice/session-297.scope<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Unit: session-297.scope<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Slice: use=
r-1000.slice<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Session: 297<br>=C2=A0 =C2=A0 =
=C2=A0Owner UID: 1000 (tkloczko)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Boot ID: ab9=
d350c623e4313bacb892de46b85f9<br>=C2=A0 =C2=A0 Machine ID: d033f66b249a4ec0=
9acfa81ac205554f<br>=C2=A0 =C2=A0 =C2=A0 Hostname: barrel<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0Storage: /var/lib/systemd/coredump/core.test_va_api.1000.ab9d3=
50c623e4313bacb892de46b85f9.3926866.1600019826000000.zst<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0Message: Process 3926866 (test_va_api) of user 1000 dumped cor=
e.<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Stack tra=
ce of thread 3926866:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 #0 =C2=A00x00007f4e2d3fb6d2 vlVaCreateContext (nouveau_drv_video.so =
+ 0xb16d2)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #1 =
=C2=A00x00007f4e2e32d0f7 vaCreateContext (libva.so.2 + 0x190f7)<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #2 =C2=A00x000055b48d29a41=
9 n/a (/home/tkloczko/rpmbuild/BUILD/libva-utils-2.9.0/test/test_va_api + 0=
x4e419)<br><br>GNU gdb (GDB) Fedora 9.0.50.20191119-2.fc32<br>Copyright (C)=
 2019 Free Software Foundation, Inc.<br>License GPLv3+: GNU GPL version 3 o=
r later &lt;<a href=3D"http://gnu.org/licenses/gpl.html">http://gnu.org/lic=
enses/gpl.html</a>&gt;<br>This is free software: you are free to change and=
 redistribute it.<br>There is NO WARRANTY, to the extent permitted by law.<=
br>Type &quot;show copying&quot; and &quot;show warranty&quot; for details.=
<br>This GDB was configured as &quot;x86_64-redhat-linux-gnu&quot;.<br>Type=
 &quot;show configuration&quot; for configuration details.<br>For bug repor=
ting instructions, please see:<br>&lt;<a href=3D"http://www.gnu.org/softwar=
e/gdb/bugs/">http://www.gnu.org/software/gdb/bugs/</a>&gt;.<br>Find the GDB=
 manual and other documentation resources online at:<br>=C2=A0 =C2=A0 &lt;<=
a href=3D"http://www.gnu.org/software/gdb/documentation/">http://www.gnu.or=
g/software/gdb/documentation/</a>&gt;.<br><br>For help, type &quot;help&quo=
t;.<br>Type &quot;apropos word&quot; to search for commands related to &quo=
t;word&quot;...<br>Reading symbols from /home/tkloczko/rpmbuild/BUILD/libva=
-utils-2.9.0/test/test_va_api...<br>[New LWP 3926866]<br>[New LWP 3926903]<=
br>[New LWP 3926906]<br>[New LWP 3926905]<br>[New LWP 3926904]<br>[Thread d=
ebugging using libthread_db enabled]<br>Using host libthread_db library &qu=
ot;/lib64/libthread_db.so.1&quot;.<br>Core was generated by `./test_va_api&=
#39;.<br>Program terminated with signal SIGSEGV, Segmentation fault.<br>#0 =
=C2=A0vlVaCreateContext (ctx=3D&lt;optimized out&gt;, config_id=3D429496729=
5, picture_width=3D1920, picture_height=3D1080, flag=3D1, render_targets=3D=
0x0, num_render_targets=3D0, context_id=3D0x55b48e39c458)<br>=C2=A0 =C2=A0 =
at ../src/gallium/state_trackers/va/context.c:229<br>229 =C2=A0 =C2=A0 ../s=
rc/gallium/state_trackers/va/context.c: No such file or directory.<br>[Curr=
ent thread is 1 (Thread 0x7f4e2ddbf4c0 (LWP 3926866))]<br>=C2=A0elfutils-li=
belf-0.181-2.fc34.x86_64 expat-2.2.9-2.2.fc34.x86_64 glibc-2.32.9000-5.fc34=
.x86_64 gmp-6.2.0-5.fc33.x86_64 libX11-1.6.12-2.fc34.x86_64 libX11-xcb-1.6.=
12-2.fc34.x86_64 libXau-1.0.9-5.fc33.x86_64 libXdmcp-1.1.3-5.fc33.x86_64 li=
bdrm-2.4.102-3.fc34.x86_64 libedit-3.1-34.20191231cvs.fc34.x86_64 libffi-3.=
2.1-2.3.fc32.x86_64 libgcc-10.2.1-3.fc34.x86_64 libstdc++-10.2.1-3.fc34.x86=
_64 libva-2.9.0-2.fc34.x86_64 libxcb-1.14-6.fc34.x86_64 libxml2-2.9.10-8.fc=
34.x86_64 libxshmfence-1.3-8.fc33.x86_64 libzstd-1.4.5-7.fc34.x86_64 llvm-l=
ibs-10.0.1-2.1.fc34.x86_64 ncurses-libs-6.2-4.20200817.fc34.x86_64 sssd-cli=
ent-2.3.0-2.fc33.x86_64 xz-libs-5.2.5-4.fc33.x86_64 z3-libs-4.8.8-5.fc33.x8=
6_64 zlib-1.2.11-23.fc33.x86_64<br>(gdb) bt full<br>Missing separate debugi=
nfos, use: dnf debuginfo-install#0 =C2=A0vlVaCreateContext (ctx=3D&lt;optim=
ized out&gt;, config_id=3D4294967295, picture_width=3D1920, picture_height=
=3D1080, flag=3D1, render_targets=3D0x0, num_render_targets=3D0, context_id=
=3D0x55b48e39c458)<br>=C2=A0 =C2=A0 at ../src/gallium/state_trackers/va/con=
text.c:229<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 drv =3D 0x55b48e398280<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 context =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 config =3D 0x0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_vpp =3D &lt;opt=
imized out&gt;<br>#1 =C2=A00x00007f4e2e32d0f7 in vaCreateContext () from /l=
ib64/libva.so.2<br>No symbol table info available.<br>#2 =C2=A00x000055b48d=
29a419 in VAAPI::VAAPIFixture::doCreateContext (this=3D&lt;optimized out&gt=
;, resolution=3D..., expectation=3D@0x7ffea3f6e468: 4) at test_va_api_fixtu=
re.cpp:436<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtest_ar =3D {success_ =3D 32, me=
ssage_ =3D {ptr_ =3D 0xebe6e1ca084a2300}}<br>#3 =C2=A00x000055b48d29ed34 in=
 VAAPI::VAAPICreateContextToFail_CreateContextWithNoConfig_Test::TestBody (=
this=3D0x55b48e39c430) at test_utils.h:36<br>No locals.<br>#4 =C2=A00x00005=
5b48d296e23 in testing::Test::Run (this=3D0x55b48e39c430) at ../test/gtest/=
src/gtest.cc:2474<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl =3D 0x55b48d91af60<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl =3D &lt;optimized out&gt;<br>#5 =C2=A0tes=
ting::Test::Run (this=3D0x55b48e39c430) at ../test/gtest/src/gtest.cc:2465<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl =3D &lt;optimized out&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 impl =3D &lt;optimized out&gt;<br>#6 =C2=A0testing::TestI=
nfo::Run (this=3D0x55b48d91fe00) at ../test/gtest/src/gtest.cc:2656<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 impl =3D 0x55b48d91af60<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 repeater =3D 0x55b48d91add0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D=
 1600019826817<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 test =3D 0x55b48e39c430<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 repeater =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 start =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 test =
=3D &lt;optimized out&gt;<br>#7 =C2=A0testing::TestInfo::Run (this=3D0x55b4=
8d91fe00) at ../test/gtest/src/gtest.cc:2630<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 impl =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 repeater =3D=
 &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D &lt;optimiz=
ed out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 test =3D &lt;optimized out&gt;<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl =3D &lt;optimized out&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 repeater =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 start =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
est =3D &lt;optimized out&gt;<br>#8 =C2=A0testing::TestCase::Run (this=3D0x=
55b48d9227d0) at ../test/gtest/src/gtest.cc:2774<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 i =3D 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl =3D 0x55b48d91af60<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 repeater =3D 0x55b48d91add0<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 start =3D 1600019826817<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl =
=3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 repeater =3D &lt;o=
ptimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D &lt;optimized out=
&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D &lt;optimized out&gt;<br>#9 =C2=
=A0testing::TestCase::Run (this=3D0x55b48d9227d0) at ../test/gtest/src/gtes=
t.cc:2759<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl =3D &lt;optimized out&gt;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 repeater =3D &lt;optimized out&gt;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 start =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 impl =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 re=
peater =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D &=
lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D &lt;optimized out=
&gt;<br>#10 testing::internal::UnitTestImpl::RunAllTests (this=3D&lt;optimi=
zed out&gt;) at ../test/gtest/src/gtest.cc:4649<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 test_index =3D 4<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D 1600019826482=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 shou=
ld_shard =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_tests=
_to_run =3D true<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 repeater =3D 0x55b48d91add0=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 forever =3D &lt;optimized out&gt;<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 in_subprocess_for_death_test =3D &lt;optimized out&gt=
;<br>--Type &lt;RET&gt; for more, q to quit, c to continue without paging--=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 failed =3D false<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 repeat =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 in_s=
ubprocess_for_death_test =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 should_shard =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 has_tests_to_run =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 failed =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 repeate=
r =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 repeat =3D &lt;o=
ptimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 forever =3D &lt;optimized o=
ut&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D &lt;optimized out&gt;<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 start =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 test_index =3D &lt;optimized out&gt;<br>#11 testing::internal::U=
nitTestImpl::RunAllTests (this=3D&lt;optimized out&gt;) at ../test/gtest/sr=
c/gtest.cc:4551<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 in_subprocess_for_death_test=
 =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 should_shard =3D =
&lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 has_tests_to_run =3D &=
lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 failed =3D &lt;optimize=
d out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 repeater =3D &lt;optimized out&gt;=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 repeat =3D &lt;optimized out&gt;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 forever =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 i =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 start=
 =3D &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_index =3D &l=
t;optimized out&gt;<br>#12 0x000055b48d265179 in testing::internal::HandleE=
xceptionsInMethodIfSupported&lt;testing::internal::UnitTestImpl, bool&gt; (=
location=3D&lt;synthetic pointer&gt;,<br>=C2=A0 =C2=A0 method=3D(bool (test=
ing::internal::UnitTestImpl::*)(testing::internal::UnitTestImpl * const)) 0=
x55b48d295c20 &lt;testing::internal::UnitTestImpl::RunAllTests()&gt;, objec=
t=3D0x55b48d91af60)<br>=C2=A0 =C2=A0 at ../test/gtest/src/gtest.cc:2410<br>=
No locals.<br>#13 testing::UnitTest::Run (this=3D0x55b48d2bb340 &lt;testing=
::UnitTest::GetInstance()::instance&gt;) at ../test/gtest/src/gtest.cc:4257=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 in_death_test_child_process =3D &lt;optimiz=
ed out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 premature_exit_file =3D &lt;optim=
ized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 in_death_test_child_process =3D=
 &lt;optimized out&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 premature_exit_file =
=3D &lt;optimized out&gt;<br>#14 RUN_ALL_TESTS () at ../test/gtest/include/=
gtest/gtest.h:2233<br>No locals.<br>#15 main (argc=3D&lt;optimized out&gt;,=
 argv=3D0x7ffea3f6e798) at test_main.cpp:31<br>No locals.<br>(gdb)<br></div=
><div class=3D"gmail_default" style=3D"font-family:monospace,monospace">```=
</div><div class=3D"gmail_default" style=3D"font-family:monospace,monospace=
"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,mon=
ospace">Any help/hints about=C2=A0what I can do to help diagnose that issue=
?</div><div class=3D"gmail_default" style=3D"font-family:monospace,monospac=
e"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,mo=
nospace">kloczek</div><div class=3D"gmail_default" style=3D"font-family:mon=
ospace,monospace">--=C2=A0<br></div><div><div dir=3D"ltr" class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"lt=
r"><font face=3D"monospace, monospace">Tomasz K=C5=82oczko | LinkedIn:=C2=
=A0<b style=3D"font-weight:normal"><a href=3D"http://lnkd.in/FXPWxH" style=
=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-size:13px;c=
olor:rgb(17,85,204);background-color:transparent;text-decoration:underline;=
vertical-align:baseline;white-space:pre-wrap">http://lnkd.in/FXPWxH</span><=
/a></b></font></div></div></div></div></div>

--00000000000069f76405af35e231--

--===============1492228403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1492228403==--
