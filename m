Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD78364FD
	for <lists+nouveau@lfdr.de>; Wed,  5 Jun 2019 21:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BE989739;
	Wed,  5 Jun 2019 19:53:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E59289733
 for <nouveau@lists.freedesktop.org>; Wed,  5 Jun 2019 19:53:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9334572167; Wed,  5 Jun 2019 19:53:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 05 Jun 2019 19:53:41 +0000
X-Bugzilla-Reason: AssignedTo QAcontact
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: crissi99@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-98039-8800-X9HVHFBEwN@http.bugs.freedesktop.org/>
In-Reply-To: <bug-98039-8800@http.bugs.freedesktop.org/>
References: <bug-98039-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 98039] KMail crash on starting (nouveau-related)
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0016156462=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0016156462==
Content-Type: multipart/alternative; boundary="15597644210.b872418C.5388"
Content-Transfer-Encoding: 7bit


--15597644210.b872418C.5388
Date: Wed, 5 Jun 2019 19:53:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98039

--- Comment #15 from Christoph Thielecke <crissi99@gmx.de> ---
I ran in similar problem:

Christoph Thielecke      2019-06-05 12:19:54 UTC=20=20
Application: kmail (5.7.3)

Qt Version: 5.9.5
Frameworks Version: 5.47.0
Operating System: Linux 4.18.0-17-generic x86_64
Distribution: Ubuntu 18.04.2 LTS

-- Information about the crash:
- What I was doing when the application crashed:
I started kmail and selected a folder with unread mail. It opens the folder
(show contents on list) but on display the mail content it crashed.

-- Backtrace:
Application: KMail (kmail), signal: Aborted
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[Current thread is 1 (Thread 0x7f923bc88b80 (LWP 3025))]

Thread 28 (Thread 0x7f9161d7c700 (LWP 3096)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x7f921fddffb8) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f921fddff68, cond=3D0x7f921fddff90) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f921fddff90,
mutex=3D0x7f921fddff68) at pthread_cond_wait.c:655
#3  0x00007f921fae95f4 in  () at /usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#4  0x00007f921fae9639 in  () at /usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#5  0x00007f922e6776db in start_thread (arg=3D0x7f9161d7c700) at
pthread_create.c:463
#6  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 27 (Thread 0x7f91631fc700 (LWP 3084)):
#0  0x00007f9238d760b4 in __GI___libc_read (fd=3D88, buf=3D0x7f91631fb810,
nbytes=3D16) at ../sysdeps/unix/sysv/linux/read.c:27
#1  0x00007f922ca662d0 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca210b7 in g_main_context_check () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f922ca21570 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#4  0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#5  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f92396689ea in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#8  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#9  0x00007f922e6776db in start_thread (arg=3D0x7f91631fc700) at
pthread_create.c:463
#10 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 26 (Thread 0x7f91957fa700 (LWP 3060)):
#0  0x00007f9238d7abf9 in __GI___poll (fds=3D0x7f9174007030, nfds=3D3, time=
out=3D-1)
at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x00007f921c49a481 in  () at /usr/lib/x86_64-linux-gnu/libpulse.so.0
#2  0x00007f921c48be40 in pa_mainloop_poll () at
/usr/lib/x86_64-linux-gnu/libpulse.so.0
#3  0x00007f921c48c4d0 in pa_mainloop_iterate () at
/usr/lib/x86_64-linux-gnu/libpulse.so.0
#4  0x00007f921c48c560 in pa_mainloop_run () at
/usr/lib/x86_64-linux-gnu/libpulse.so.0
#5  0x00007f921c49a3c9 in  () at /usr/lib/x86_64-linux-gnu/libpulse.so.0
#6  0x00007f9213ac8318 in  () at
/usr/lib/x86_64-linux-gnu/pulseaudio/libpulsecommon-11.1.so
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91957fa700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 25 (Thread 0x7f9195ffb700 (LWP 3059)):
#0  0x00007f9238d966ac in __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f9238d98474 in ___fprintf_chk (fp=3D0x7f92390538b0
<_IO_stdfile_2_lock>, flag=3D1, format=3D0x7f921a51a6a8 "[%s] %s\n") at
fprintf_chk.c:30
#2  0x00007f921a5029ad in event_logv_ () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#3  0x00007f921a502b44 in event_warn () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#4  0x00007f921a50446c in  () at /usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#5  0x00007f921a4fa114 in event_base_loop () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#6  0x00007f92234e9ab9 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f922e6776db in start_thread (arg=3D0x7f9195ffb700) at
pthread_create.c:463
#12 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 24 (Thread 0x7f91967fc700 (LWP 3058)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x7f91967fb738) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91967fb6e8, cond=3D0x7f91967fb710) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91967fb710,
mutex=3D0x7f91967fb6e8) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922e6776db in start_thread (arg=3D0x7f91967fc700) at
pthread_create.c:463
#11 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 23 (Thread 0x7f9196ffd700 (LWP 3057)):
#0  0x00007f922e67ded9 in futex_reltimed_wait_cancelable (private=3D<optimi=
zed
out>, reltime=3D0x7f9196ffc5d0, expected=3D0, futex_word=3D0x7f9196ffc758) =
at
../sysdeps/unix/sysv/linux/futex-internal.h:142
#1  0x00007f922e67ded9 in __pthread_cond_wait_common (abstime=3D0x7f9196ffc=
670,
mutex=3D0x7f9196ffc708, cond=3D0x7f9196ffc730) at pthread_cond_wait.c:533
#2  0x00007f922e67ded9 in __pthread_cond_timedwait (cond=3D0x7f9196ffc730,
mutex=3D0x7f9196ffc708, abstime=3D0x7f9196ffc670) at pthread_cond_wait.c:667
#3  0x00007f9223547652 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e91e in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e952b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922e6776db in start_thread (arg=3D0x7f9196ffd700) at
pthread_create.c:463
#11 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 22 (Thread 0x7f91977fe700 (LWP 3056)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x55ed99707828) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x55ed99707768, cond=3D0x55ed99707800) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x55ed99707800,
mutex=3D0x55ed99707768) at pthread_cond_wait.c:655
#3  0x00007f9223ca0060 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f9223519f11 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f922e6776db in start_thread (arg=3D0x7f91977fe700) at
pthread_create.c:463
#7  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 21 (Thread 0x7f9197fff700 (LWP 3055)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x7f9197ffe738) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f9197ffe6e8, cond=3D0x7f9197ffe710) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f9197ffe710,
mutex=3D0x7f9197ffe6e8) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922e6776db in start_thread (arg=3D0x7f9197fff700) at
pthread_create.c:463
#11 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 20 (Thread 0x7f91b8ff9700 (LWP 3054)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x55ed99737678) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x55ed99737628, cond=3D0x55ed99737650) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x55ed99737650,
mutex=3D0x55ed99737628) at pthread_cond_wait.c:655
#3  0x00007f9223518c95 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f9223519177 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f9223519f11 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91b8ff9700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 19 (Thread 0x7f91b97fa700 (LWP 3053)):
#0  0x00007f9238d966ac in __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f9238d98474 in ___fprintf_chk (fp=3D0x7f92390538b0
<_IO_stdfile_2_lock>, flag=3D1, format=3D0x7f921a51a6a8 "[%s] %s\n") at
fprintf_chk.c:30
#2  0x00007f921a5029ad in event_logv_ () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#3  0x00007f921a502b44 in event_warn () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#4  0x00007f921a50446c in  () at /usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#5  0x00007f921a4fa114 in event_base_loop () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#6  0x00007f92234e9bf3 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da0978 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f9222da0f2b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#13 0x00007f922e6776db in start_thread (arg=3D0x7f91b97fa700) at
pthread_create.c:463
#14 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 18 (Thread 0x7f91b9ffb700 (LWP 3052)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x7f91b9ffa358) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91b9ffa308, cond=3D0x7f91b9ffa330) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91b9ffa330,
mutex=3D0x7f91b9ffa308) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f9222da08c8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da0f1b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f922e6776db in start_thread (arg=3D0x7f91b9ffb700) at
pthread_create.c:463
#13 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 17 (Thread 0x7f91ba7fc700 (LWP 3051)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x7f91ba7fb358) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91ba7fb308, cond=3D0x7f91ba7fb330) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91ba7fb330,
mutex=3D0x7f91ba7fb308) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f9222da0818 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da0f0b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f922e6776db in start_thread (arg=3D0x7f91ba7fc700) at
pthread_create.c:463
#13 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 16 (Thread 0x7f91baffd700 (LWP 3050)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x7f91baffc358) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91baffc308, cond=3D0x7f91baffc330) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91baffc330,
mutex=3D0x7f91baffc308) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f9222da0768 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da0efb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f922e6776db in start_thread (arg=3D0x7f91baffd700) at
pthread_create.c:463
#13 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 15 (Thread 0x7f91bb7fe700 (LWP 3049)):
#0  0x00007f9238d966ac in __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f9238d98474 in ___fprintf_chk (fp=3D0x7f92390538b0
<_IO_stdfile_2_lock>, flag=3D1, format=3D0x7f921a51a6a8 "[%s] %s\n") at
fprintf_chk.c:30
#2  0x00007f921a5029ad in event_logv_ () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#3  0x00007f921a502b44 in event_warn () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#4  0x00007f921a50446c in  () at /usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#5  0x00007f921a4fa114 in event_base_loop () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#6  0x00007f92234e9b0d in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da06b8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f9222da0eeb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#13 0x00007f922e6776db in start_thread (arg=3D0x7f91bb7fe700) at
pthread_create.c:463
#14 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 14 (Thread 0x7f91d0876700 (LWP 3048)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x7f91d0875358) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91d0875308, cond=3D0x7f91d0875330) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91d0875330,
mutex=3D0x7f91d0875308) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f9222da0608 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da0edb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f922e6776db in start_thread (arg=3D0x7f91d0876700) at
pthread_create.c:463
#13 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 13 (Thread 0x7f91bbfff700 (LWP 3047)):
#0  0x00007f922e67ded9 in futex_reltimed_wait_cancelable (private=3D<optimi=
zed
out>, reltime=3D0x7f91bbffe7e0, expected=3D0, futex_word=3D0x7f91bc004660) =
at
../sysdeps/unix/sysv/linux/futex-internal.h:142
#1  0x00007f922e67ded9 in __pthread_cond_wait_common (abstime=3D0x7f91bbffe=
880,
mutex=3D0x7f91bc004610, cond=3D0x7f91bc004638) at pthread_cond_wait.c:533
#2  0x00007f922e67ded9 in __pthread_cond_timedwait (cond=3D0x7f91bc004638,
mutex=3D0x7f91bc004610, abstime=3D0x7f91bbffe880) at pthread_cond_wait.c:667
#3  0x00007f9223547652 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922351d799 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f922351dcfb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91bbfff700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 12 (Thread 0x7f91d1077700 (LWP 3046)):
#0  0x00007f922e67ded9 in futex_reltimed_wait_cancelable (private=3D<optimi=
zed
out>, reltime=3D0x7f91d10767e0, expected=3D0, futex_word=3D0x7f91bc004664) =
at
../sysdeps/unix/sysv/linux/futex-internal.h:142
#1  0x00007f922e67ded9 in __pthread_cond_wait_common (abstime=3D0x7f91d1076=
880,
mutex=3D0x7f91bc004610, cond=3D0x7f91bc004638) at pthread_cond_wait.c:533
#2  0x00007f922e67ded9 in __pthread_cond_timedwait (cond=3D0x7f91bc004638,
mutex=3D0x7f91bc004610, abstime=3D0x7f91d1076880) at pthread_cond_wait.c:667
#3  0x00007f9223547652 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922351d799 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f922351dcfb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91d1077700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 11 (Thread 0x7f91d1878700 (LWP 3045)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x7f91d1877738) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91d18776e8, cond=3D0x7f91d1877710) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91d1877710,
mutex=3D0x7f91d18776e8) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922e6776db in start_thread (arg=3D0x7f91d1878700) at
pthread_create.c:463
#11 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 10 (Thread 0x7f91d2079700 (LWP 3044)):
#0  0x00007f9238d76187 in __GI___libc_write (fd=3D2, buf=3D0x7f91d2075ac0,
nbytes=3D47) at ../sysdeps/unix/sysv/linux/write.c:27
#1  0x00007f9238cf11bd in _IO_new_file_write (f=3D0x7f9239052680
<_IO_2_1_stderr_>, data=3D0x7f91d2075ac0, n=3D47) at fileops.c:1203
#2  0x00007f9238cf1b2f in new_do_write (to_do=3D<optimized out>,
data=3D0x7f91d2075ac0 "[warn] epoll_wait: Ung\303\274ltiger Dateideskriptor=
\n",
fp=3D0x7f9239052680 <_IO_2_1_stderr_>) at fileops.c:457
#3  0x00007f9238cf1b2f in _IO_new_file_xsputn (f=3D0x7f9239052680
<_IO_2_1_stderr_>, data=3D<optimized out>, n=3D47) at fileops.c:1277
#4  0x00007f9238cc4707 in buffered_vfprintf (s=3Ds@entry=3D0x7f9239052680
<_IO_2_1_stderr_>, format=3Dformat@entry=3D0x7f921a51a6a8 "[%s] %s\n",
args=3Dargs@entry=3D0x7f91d2078080) at vfprintf.c:2350
#5  0x00007f9238cc1726 in _IO_vfprintf_internal (s=3Ds@entry=3D0x7f92390526=
80
<_IO_2_1_stderr_>, format=3D0x7f921a51a6a8 "[%s] %s\n",
ap=3Dap@entry=3D0x7f91d2078080) at vfprintf.c:1301
#6  0x00007f9238d984c6 in ___fprintf_chk (fp=3D0x7f9239052680 <_IO_2_1_stde=
rr_>,
flag=3D1, format=3D<optimized out>) at fprintf_chk.c:35
#7  0x00007f921a5029ad in event_logv_ () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#8  0x00007f921a502b44 in event_warn () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#9  0x00007f921a50446c in  () at /usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#10 0x00007f921a4fa114 in event_base_loop () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#11 0x00007f92234e9ab9 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#13 0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#14 0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#15 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#16 0x00007f922e6776db in start_thread (arg=3D0x7f91d2079700) at
pthread_create.c:463
#17 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 9 (Thread 0x7f91d3fff700 (LWP 3037)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x55ed996f9390) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x55ed996f9340, cond=3D0x55ed996f9368) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x55ed996f9368,
mutex=3D0x55ed996f9340) at pthread_cond_wait.c:655
#3  0x00007f923948d59b in QWaitCondition::wait(QMutex*, unsigned long) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007f9239485c0b in QSemaphore::acquire(int) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007f91dd1cb80c in  () at
/usr/lib/x86_64-linux-gnu/qt5/plugins/texttospeech/libqttexttospeech_flite.=
so
#6  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91d3fff700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 8 (Thread 0x7f91de074700 (LWP 3035)):
#0  0x00007f922e67f035 in __GI___pthread_getspecific (key=3D7) at
pthread_getspecific.c:31
#1  0x00007f922ca49680 in g_thread_self () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca216cd in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007f92396689ea in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91de074700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 7 (Thread 0x7f91e73a1700 (LWP 3032)):
#0  0x00007f9238d760b4 in __GI___libc_read (fd=3D16, buf=3D0x7f91e73a0810,
nbytes=3D16) at ../sysdeps/unix/sysv/linux/read.c:27
#1  0x00007f922ca662d0 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca210b7 in g_main_context_check () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f922ca21570 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#4  0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#5  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f92396689ea in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#8  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#9  0x00007f922e6776db in start_thread (arg=3D0x7f91e73a1700) at
pthread_create.c:463
#10 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 6 (Thread 0x7f91e7ba2700 (LWP 3031)):
#0  0x00007f9238d7abf9 in __GI___poll (fds=3D0x7f91e0003ce0, nfds=3D1, time=
out=3D-1)
at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x00007f922ca215c9 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007f92396689ea in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91e7ba2700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 5 (Thread 0x7f91f4c25700 (LWP 3030)):
#0  0x00007f922ca20e18 in g_main_context_check () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#1  0x00007f922ca21570 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007f92396689ea in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91f4c25700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 4 (Thread 0x7f91f5e36700 (LWP 3029)):
#0  0x00007f9238d760b4 in __GI___libc_read (fd=3D10, buf=3D0x7f91f5e357e0,
nbytes=3D16) at ../sysdeps/unix/sysv/linux/read.c:27
#1  0x00007f922ca662d0 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca210b7 in g_main_context_check () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f922ca21570 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#4  0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#5  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f92396689ea in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#8  0x00007f9237cbed45 in  () at /usr/lib/x86_64-linux-gnu/libQt5DBus.so.5
#9  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#10 0x00007f922e6776db in start_thread (arg=3D0x7f91f5e36700) at
pthread_create.c:463
#11 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 3 (Thread 0x7f91f6b17700 (LWP 3028)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x55ed99345848) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x55ed993457f8, cond=3D0x55ed99345820) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x55ed99345820,
mutex=3D0x55ed993457f8) at pthread_cond_wait.c:655
#3  0x00007f9200398e6b in  () at /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.=
so
#4  0x00007f9200398b97 in  () at /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.=
so
#5  0x00007f922e6776db in start_thread (arg=3D0x7f91f6b17700) at
pthread_create.c:463
#6  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 2 (Thread 0x7f920390b700 (LWP 3027)):
#0  0x00007f9238d7abf9 in __GI___poll (fds=3D0x7f920390a928, nfds=3D1, time=
out=3D-1)
at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x00007f922be50747 in  () at /usr/lib/x86_64-linux-gnu/libxcb.so.1
#2  0x00007f922be5236a in xcb_wait_for_event () at
/usr/lib/x86_64-linux-gnu/libxcb.so.1
#3  0x00007f92056062a9 in  () at /usr/lib/x86_64-linux-gnu/libQt5XcbQpa.so.5
#4  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007f922e6776db in start_thread (arg=3D0x7f920390b700) at
pthread_create.c:463
#6  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 1 (Thread 0x7f923bc88b80 (LWP 3025)):
[KCrash Handler]
#6  0x00007f9238ca4e97 in __GI_raise (sig=3Dsig@entry=3D6) at
../sysdeps/unix/sysv/linux/raise.c:51
#7  0x00007f9238ca6801 in __GI_abort () at abort.c:79
#8  0x00007f9238c9639a in __assert_fail_base (fmt=3D0x7f923bd43195 "%s%s%s:=
%u:
%s%sZusicherung \302\273%s\302\253 nicht erf\303\274llt.\n%n",
assertion=3Dassertion@entry=3D0x7f91fbbee608 "kref", file=3Dfile@entry=3D0x=
7f91fbbee5f2
"../nouveau/pushbuf.c", line=3Dline@entry=3D723,
function=3Dfunction@entry=3D0x7f91fbbee740 "nouveau_pushbuf_data") at asser=
t.c:92
#9  0x00007f9238c96412 in __GI___assert_fail (assertion=3D0x7f91fbbee608 "k=
ref",
file=3D0x7f91fbbee5f2 "../nouveau/pushbuf.c", line=3D723, function=3D0x7f91=
fbbee740
"nouveau_pushbuf_data") at assert.c:101
#10 0x00007f91fbbec9ad in  () at /usr/lib/x86_64-linux-gnu/libdrm_nouveau.s=
o.2
#11 0x00007f91fbbec966 in nouveau_pushbuf_data () at
/usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2
#12 0x00007f91fbbeca3f in  () at /usr/lib/x86_64-linux-gnu/libdrm_nouveau.s=
o.2
#13 0x00007f91fbbeceaf in  () at /usr/lib/x86_64-linux-gnu/libdrm_nouveau.s=
o.2
#14 0x00007f91fbbeda40 in nouveau_pushbuf_kick () at
/usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2
#15 0x00007f9200669116 in  () at /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.=
so
#16 0x00007f92002d0b8b in  () at /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.=
so
#17 0x00007f920049520a in  () at /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.=
so
#18 0x00007f9201c4fd88 in  () at /usr/lib/x86_64-linux-gnu/libGLX_mesa.so.0
#19 0x00007f9202f038f2 in  () at
/usr/lib/x86_64-linux-gnu/qt5/plugins/xcbglintegrations/libqxcb-glx-integra=
tion.so
#20 0x00007f9239c6600a in QOpenGLContext::swapBuffers(QSurface*) () at
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#21 0x00007f9239f1ab9f in QPlatformBackingStore::composeAndFlush(QWindow*,
QRegion const&, QPoint const&, QPlatformTextureList*, QOpenGLContext*, bool=
) ()
at /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#22 0x00007f9205625df7 in  () at /usr/lib/x86_64-linux-gnu/libQt5XcbQpa.so.5
#23 0x00007f923a3f5067 in  () at /usr/lib/x86_64-linux-gnu/libQt5Widgets.so=
.5
#24 0x00007f923a3f67e2 in  () at /usr/lib/x86_64-linux-gnu/libQt5Widgets.so=
.5
#25 0x00007f923a3f778f in  () at /usr/lib/x86_64-linux-gnu/libQt5Widgets.so=
.5
#26 0x00007f923a3f8095 in  () at /usr/lib/x86_64-linux-gnu/libQt5Widgets.so=
.5
#27 0x00007f923a40f66f in QWidgetPrivate::syncBackingStore() () at
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#28 0x00007f923a4271a8 in QWidget::event(QEvent*) () at
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#29 0x00007f923a53ac4b in QMainWindow::event(QEvent*) () at
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#30 0x00007f923877ab87 in KMainWindow::event(QEvent*) () at
/usr/lib/x86_64-linux-gnu/libKF5XmlGui.so.5
#31 0x00007f92387bfa05 in KXmlGuiWindow::event(QEvent*) () at
/usr/lib/x86_64-linux-gnu/libKF5XmlGui.so.5
#32 0x00007f923a3e882c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() at /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#33 0x00007f923a3f00f4 in QApplication::notify(QObject*, QEvent*) () at
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#34 0x00007f923966a9a8 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#35 0x00007f923966d11d in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#36 0x00007f92396c42c3 in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#37 0x00007f922ca21417 in g_main_context_dispatch () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#38 0x00007f922ca21650 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#39 0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#40 0x00007f92396c38ef in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#41 0x00007f92396689ea in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#42 0x00007f9239671a84 in QCoreApplication::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#43 0x000055ed988f37cd in  ()
#44 0x00007f9238c87b97 in __libc_start_main (main=3D0x55ed988f2840, argc=3D=
3,
argv=3D0x7fff13144e48, init=3D<optimized out>, fini=3D<optimized out>,
rtld_fini=3D<optimized out>, stack_end=3D0x7fff13144e38) at ../csu/libc-sta=
rt.c:310
#45 0x000055ed988f38fa in _start ()


--- end backtrace ----

dpkg -l| grep mesa
ii  libegl-mesa0:amd64                              18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        free implementation of the EGL API -- =
Mesa
vendor library
ii  libegl1-mesa:amd64                              18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        transitional dummy package
ii  libgl1-mesa-dri:amd64                           18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        free implementation of the OpenGL API =
--
DRI modules
ii  libgl1-mesa-dri:i386                            18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        i386         free implementation of the OpenGL API =
--
DRI modules
ii  libgl1-mesa-glx:i386                            18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        i386         transitional dummy package
ii  libglapi-mesa:amd64                             18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        free implementation of the GL API --
shared library
ii  libglapi-mesa:i386                              18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        i386         free implementation of the GL API --
shared library
ii  libglu1-mesa:amd64                              9.0.0-2.1build1=20=20=
=20=20=20=20=20=20=20=20=20=20
                        amd64        Mesa OpenGL utility library (GLU)
ii  libglu1-mesa:i386                               9.0.0-2.1build1=20=20=
=20=20=20=20=20=20=20=20=20=20
                        i386         Mesa OpenGL utility library (GLU)
ii  libglx-mesa0:amd64                              18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        free implementation of the OpenGL API =
--
GLX vendor library
ii  libglx-mesa0:i386                               18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        i386         free implementation of the OpenGL API =
--
GLX vendor library
ii  libosmesa6:amd64                                18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        Mesa Off-screen rendering extension
ii  libosmesa6:i386                                 18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        i386         Mesa Off-screen rendering extension
ii  libwayland-egl1-mesa:amd64                      18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        transitional dummy package
ii  mesa-utils                                      8.4.0-1=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        Miscellaneous Mesa GL utilities
ii  mesa-va-drivers:amd64                           18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        Mesa VA-API video acceleration drivers
ii  mesa-vdpau-drivers:amd64                        18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        Mesa VDPAU video acceleration drivers

dpkg -l| grep xorg
ii  python3-xkit                                    0.5.0ubuntu2=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
                        all          library for the manipulation of xorg.c=
onf
files (Python 3)
ii  xorg                                            1:7.7+19ubuntu7.1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X Window System
ii  xorg-docs-core                                  1:1.7.1-1.1=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
                        all          Core documentation for the X.org X Win=
dow
System
ii  xorg-sgml-doctools                              1:1.11-1=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                        all          Common tools for building X.Org SGML
documentation
ii  xserver-xorg                                    1:7.7+19ubuntu7.1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X server
ii  xserver-xorg-core                               2:1.19.6-1ubuntu4.2=20=
=20=20=20=20=20=20=20
                        amd64        Xorg X server - core server
ii  xserver-xorg-input-all                          1:7.7+19ubuntu7.1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- input driver metapac=
kage
ii  xserver-xorg-input-evdev                        1:2.10.5-1ubuntu1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- evdev input driver
ii  xserver-xorg-input-libinput                     0.27.1-1=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- libinput input driver
ii  xserver-xorg-input-synaptics                    1.9.0-1ubuntu1=20=20=20=
=20=20=20=20=20=20=20=20=20=20
                        amd64        Synaptics TouchPad driver for X.Org se=
rver
ii  xserver-xorg-input-wacom                        1:0.36.1-0ubuntu1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- Wacom input driver
ii  xserver-xorg-legacy                             2:1.19.6-1ubuntu4.2=20=
=20=20=20=20=20=20=20
                        amd64        setuid root Xorg server wrapper
ii  xserver-xorg-video-all                          1:7.7+19ubuntu7.1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- output driver
metapackage
ii  xserver-xorg-video-amdgpu                       18.0.1-1=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- AMDGPU display driver
ii  xserver-xorg-video-ati                          1:18.0.1-1=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- AMD/ATI display driv=
er
wrapper
ii  xserver-xorg-video-fbdev                        1:0.4.4-1build6=20=20=
=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- fbdev display driver
ii  xserver-xorg-video-intel                        2:2.99.917+git20171229-=
1=20=20=20
                        amd64        X.Org X server -- Intel i8xx, i9xx dis=
play
driver
ii  xserver-xorg-video-nouveau                      1:1.0.15-2=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- Nouveau display driv=
er=20=20=20
ii  xserver-xorg-video-qxl                          0.1.5-2build1=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- QXL display driver=
=20=20=20=20=20=20=20
ii  xserver-xorg-video-radeon                       1:18.0.1-1=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- AMD/ATI Radeon displ=
ay
driver=20=20=20=20=20=20
ii  xserver-xorg-video-vesa                         1:2.3.4-1build3=20=20=
=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- VESA display driver=
=20=20=20=20=20=20
ii  xserver-xorg-video-vmware                       1:13.2.1-1build1=20=20=
=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- VMware display driver

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15597644210.b872418C.5388
Date: Wed, 5 Jun 2019 19:53:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039#c15">Commen=
t # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039">bug 98039<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
crissi99&#64;gmx.de" title=3D"Christoph Thielecke &lt;crissi99&#64;gmx.de&g=
t;"> <span class=3D"fn">Christoph Thielecke</span></a>
</span></b>
        <pre>I ran in similar problem:

Christoph Thielecke      2019-06-05 12:19:54 UTC=20=20
Application: kmail (5.7.3)

Qt Version: 5.9.5
Frameworks Version: 5.47.0
Operating System: Linux 4.18.0-17-generic x86_64
Distribution: Ubuntu 18.04.2 LTS

-- Information about the crash:
- What I was doing when the application crashed:
I started kmail and selected a folder with unread mail. It opens the folder
(show contents on list) but on display the mail content it crashed.

-- Backtrace:
Application: KMail (kmail), signal: Aborted
Using host libthread_db library &quot;/lib/x86_64-linux-gnu/libthread_db.so=
.1&quot;.
[Current thread is 1 (Thread 0x7f923bc88b80 (LWP 3025))]

Thread 28 (Thread 0x7f9161d7c700 (LWP 3096)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x7f921fddffb8) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f921fddff68, cond=3D0x7f921fddff90) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f921fddff90,
mutex=3D0x7f921fddff68) at pthread_cond_wait.c:655
#3  0x00007f921fae95f4 in  () at /usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#4  0x00007f921fae9639 in  () at /usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#5  0x00007f922e6776db in start_thread (arg=3D0x7f9161d7c700) at
pthread_create.c:463
#6  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 27 (Thread 0x7f91631fc700 (LWP 3084)):
#0  0x00007f9238d760b4 in __GI___libc_read (fd=3D88, buf=3D0x7f91631fb810,
nbytes=3D16) at ../sysdeps/unix/sysv/linux/read.c:27
#1  0x00007f922ca662d0 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca210b7 in g_main_context_check () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f922ca21570 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#4  0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#5  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f92396689ea in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#8  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#9  0x00007f922e6776db in start_thread (arg=3D0x7f91631fc700) at
pthread_create.c:463
#10 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 26 (Thread 0x7f91957fa700 (LWP 3060)):
#0  0x00007f9238d7abf9 in __GI___poll (fds=3D0x7f9174007030, nfds=3D3, time=
out=3D-1)
at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x00007f921c49a481 in  () at /usr/lib/x86_64-linux-gnu/libpulse.so.0
#2  0x00007f921c48be40 in pa_mainloop_poll () at
/usr/lib/x86_64-linux-gnu/libpulse.so.0
#3  0x00007f921c48c4d0 in pa_mainloop_iterate () at
/usr/lib/x86_64-linux-gnu/libpulse.so.0
#4  0x00007f921c48c560 in pa_mainloop_run () at
/usr/lib/x86_64-linux-gnu/libpulse.so.0
#5  0x00007f921c49a3c9 in  () at /usr/lib/x86_64-linux-gnu/libpulse.so.0
#6  0x00007f9213ac8318 in  () at
/usr/lib/x86_64-linux-gnu/pulseaudio/libpulsecommon-11.1.so
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91957fa700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 25 (Thread 0x7f9195ffb700 (LWP 3059)):
#0  0x00007f9238d966ac in __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f9238d98474 in ___fprintf_chk (fp=3D0x7f92390538b0
&lt;_IO_stdfile_2_lock&gt;, flag=3D1, format=3D0x7f921a51a6a8 &quot;[%s] %s=
\n&quot;) at
fprintf_chk.c:30
#2  0x00007f921a5029ad in event_logv_ () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#3  0x00007f921a502b44 in event_warn () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#4  0x00007f921a50446c in  () at /usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#5  0x00007f921a4fa114 in event_base_loop () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#6  0x00007f92234e9ab9 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f922e6776db in start_thread (arg=3D0x7f9195ffb700) at
pthread_create.c:463
#12 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 24 (Thread 0x7f91967fc700 (LWP 3058)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x7f91967fb738) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91967fb6e8, cond=3D0x7f91967fb710) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91967fb710,
mutex=3D0x7f91967fb6e8) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922e6776db in start_thread (arg=3D0x7f91967fc700) at
pthread_create.c:463
#11 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 23 (Thread 0x7f9196ffd700 (LWP 3057)):
#0  0x00007f922e67ded9 in futex_reltimed_wait_cancelable (private=3D&lt;opt=
imized
out&gt;, reltime=3D0x7f9196ffc5d0, expected=3D0, futex_word=3D0x7f9196ffc75=
8) at
../sysdeps/unix/sysv/linux/futex-internal.h:142
#1  0x00007f922e67ded9 in __pthread_cond_wait_common (abstime=3D0x7f9196ffc=
670,
mutex=3D0x7f9196ffc708, cond=3D0x7f9196ffc730) at pthread_cond_wait.c:533
#2  0x00007f922e67ded9 in __pthread_cond_timedwait (cond=3D0x7f9196ffc730,
mutex=3D0x7f9196ffc708, abstime=3D0x7f9196ffc670) at pthread_cond_wait.c:667
#3  0x00007f9223547652 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e91e in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e952b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922e6776db in start_thread (arg=3D0x7f9196ffd700) at
pthread_create.c:463
#11 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 22 (Thread 0x7f91977fe700 (LWP 3056)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x55ed99707828) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x55ed99707768, cond=3D0x55ed99707800) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x55ed99707800,
mutex=3D0x55ed99707768) at pthread_cond_wait.c:655
#3  0x00007f9223ca0060 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f9223519f11 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f922e6776db in start_thread (arg=3D0x7f91977fe700) at
pthread_create.c:463
#7  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 21 (Thread 0x7f9197fff700 (LWP 3055)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x7f9197ffe738) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f9197ffe6e8, cond=3D0x7f9197ffe710) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f9197ffe710,
mutex=3D0x7f9197ffe6e8) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922e6776db in start_thread (arg=3D0x7f9197fff700) at
pthread_create.c:463
#11 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 20 (Thread 0x7f91b8ff9700 (LWP 3054)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x55ed99737678) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x55ed99737628, cond=3D0x55ed99737650) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x55ed99737650,
mutex=3D0x55ed99737628) at pthread_cond_wait.c:655
#3  0x00007f9223518c95 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f9223519177 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f9223519f11 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91b8ff9700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 19 (Thread 0x7f91b97fa700 (LWP 3053)):
#0  0x00007f9238d966ac in __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f9238d98474 in ___fprintf_chk (fp=3D0x7f92390538b0
&lt;_IO_stdfile_2_lock&gt;, flag=3D1, format=3D0x7f921a51a6a8 &quot;[%s] %s=
\n&quot;) at
fprintf_chk.c:30
#2  0x00007f921a5029ad in event_logv_ () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#3  0x00007f921a502b44 in event_warn () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#4  0x00007f921a50446c in  () at /usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#5  0x00007f921a4fa114 in event_base_loop () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#6  0x00007f92234e9bf3 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da0978 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f9222da0f2b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#13 0x00007f922e6776db in start_thread (arg=3D0x7f91b97fa700) at
pthread_create.c:463
#14 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 18 (Thread 0x7f91b9ffb700 (LWP 3052)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x7f91b9ffa358) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91b9ffa308, cond=3D0x7f91b9ffa330) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91b9ffa330,
mutex=3D0x7f91b9ffa308) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f9222da08c8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da0f1b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f922e6776db in start_thread (arg=3D0x7f91b9ffb700) at
pthread_create.c:463
#13 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 17 (Thread 0x7f91ba7fc700 (LWP 3051)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x7f91ba7fb358) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91ba7fb308, cond=3D0x7f91ba7fb330) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91ba7fb330,
mutex=3D0x7f91ba7fb308) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f9222da0818 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da0f0b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f922e6776db in start_thread (arg=3D0x7f91ba7fc700) at
pthread_create.c:463
#13 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 16 (Thread 0x7f91baffd700 (LWP 3050)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x7f91baffc358) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91baffc308, cond=3D0x7f91baffc330) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91baffc330,
mutex=3D0x7f91baffc308) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f9222da0768 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da0efb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f922e6776db in start_thread (arg=3D0x7f91baffd700) at
pthread_create.c:463
#13 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 15 (Thread 0x7f91bb7fe700 (LWP 3049)):
#0  0x00007f9238d966ac in __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f9238d98474 in ___fprintf_chk (fp=3D0x7f92390538b0
&lt;_IO_stdfile_2_lock&gt;, flag=3D1, format=3D0x7f921a51a6a8 &quot;[%s] %s=
\n&quot;) at
fprintf_chk.c:30
#2  0x00007f921a5029ad in event_logv_ () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#3  0x00007f921a502b44 in event_warn () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#4  0x00007f921a50446c in  () at /usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#5  0x00007f921a4fa114 in event_base_loop () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#6  0x00007f92234e9b0d in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da06b8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f9222da0eeb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#13 0x00007f922e6776db in start_thread (arg=3D0x7f91bb7fe700) at
pthread_create.c:463
#14 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 14 (Thread 0x7f91d0876700 (LWP 3048)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x7f91d0875358) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91d0875308, cond=3D0x7f91d0875330) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91d0875330,
mutex=3D0x7f91d0875308) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f9222da0608 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f9222da0edb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922351a588 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#11 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f922e6776db in start_thread (arg=3D0x7f91d0876700) at
pthread_create.c:463
#13 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 13 (Thread 0x7f91bbfff700 (LWP 3047)):
#0  0x00007f922e67ded9 in futex_reltimed_wait_cancelable (private=3D&lt;opt=
imized
out&gt;, reltime=3D0x7f91bbffe7e0, expected=3D0, futex_word=3D0x7f91bc00466=
0) at
../sysdeps/unix/sysv/linux/futex-internal.h:142
#1  0x00007f922e67ded9 in __pthread_cond_wait_common (abstime=3D0x7f91bbffe=
880,
mutex=3D0x7f91bc004610, cond=3D0x7f91bc004638) at pthread_cond_wait.c:533
#2  0x00007f922e67ded9 in __pthread_cond_timedwait (cond=3D0x7f91bc004638,
mutex=3D0x7f91bc004610, abstime=3D0x7f91bbffe880) at pthread_cond_wait.c:667
#3  0x00007f9223547652 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922351d799 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f922351dcfb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91bbfff700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 12 (Thread 0x7f91d1077700 (LWP 3046)):
#0  0x00007f922e67ded9 in futex_reltimed_wait_cancelable (private=3D&lt;opt=
imized
out&gt;, reltime=3D0x7f91d10767e0, expected=3D0, futex_word=3D0x7f91bc00466=
4) at
../sysdeps/unix/sysv/linux/futex-internal.h:142
#1  0x00007f922e67ded9 in __pthread_cond_wait_common (abstime=3D0x7f91d1076=
880,
mutex=3D0x7f91bc004610, cond=3D0x7f91bc004638) at pthread_cond_wait.c:533
#2  0x00007f922e67ded9 in __pthread_cond_timedwait (cond=3D0x7f91bc004638,
mutex=3D0x7f91bc004610, abstime=3D0x7f91d1076880) at pthread_cond_wait.c:667
#3  0x00007f9223547652 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922351d799 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f922351dcfb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91d1077700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 11 (Thread 0x7f91d1878700 (LWP 3045)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x7f91d1877738) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x7f91d18776e8, cond=3D0x7f91d1877710) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x7f91d1877710,
mutex=3D0x7f91d18776e8) at pthread_cond_wait.c:655
#3  0x00007f922350e999 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#4  0x00007f922350e9c7 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#5  0x00007f92234e94db in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#6  0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#7  0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#8  0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#9  0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#10 0x00007f922e6776db in start_thread (arg=3D0x7f91d1878700) at
pthread_create.c:463
#11 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 10 (Thread 0x7f91d2079700 (LWP 3044)):
#0  0x00007f9238d76187 in __GI___libc_write (fd=3D2, buf=3D0x7f91d2075ac0,
nbytes=3D47) at ../sysdeps/unix/sysv/linux/write.c:27
#1  0x00007f9238cf11bd in _IO_new_file_write (f=3D0x7f9239052680
&lt;_IO_2_1_stderr_&gt;, data=3D0x7f91d2075ac0, n=3D47) at fileops.c:1203
#2  0x00007f9238cf1b2f in new_do_write (to_do=3D&lt;optimized out&gt;,
data=3D0x7f91d2075ac0 &quot;[warn] epoll_wait: Ung\303\274ltiger Dateideskr=
iptor\n&quot;,
fp=3D0x7f9239052680 &lt;_IO_2_1_stderr_&gt;) at fileops.c:457
#3  0x00007f9238cf1b2f in _IO_new_file_xsputn (f=3D0x7f9239052680
&lt;_IO_2_1_stderr_&gt;, data=3D&lt;optimized out&gt;, n=3D47) at fileops.c=
:1277
#4  0x00007f9238cc4707 in buffered_vfprintf (s=3Ds&#64;entry=3D0x7f92390526=
80
&lt;_IO_2_1_stderr_&gt;, format=3Dformat&#64;entry=3D0x7f921a51a6a8 &quot;[=
%s] %s\n&quot;,
args=3Dargs&#64;entry=3D0x7f91d2078080) at vfprintf.c:2350
#5  0x00007f9238cc1726 in _IO_vfprintf_internal (s=3Ds&#64;entry=3D0x7f9239=
052680
&lt;_IO_2_1_stderr_&gt;, format=3D0x7f921a51a6a8 &quot;[%s] %s\n&quot;,
ap=3Dap&#64;entry=3D0x7f91d2078080) at vfprintf.c:1301
#6  0x00007f9238d984c6 in ___fprintf_chk (fp=3D0x7f9239052680 &lt;_IO_2_1_s=
tderr_&gt;,
flag=3D1, format=3D&lt;optimized out&gt;) at fprintf_chk.c:35
#7  0x00007f921a5029ad in event_logv_ () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#8  0x00007f921a502b44 in event_warn () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#9  0x00007f921a50446c in  () at /usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#10 0x00007f921a4fa114 in event_base_loop () at
/usr/lib/x86_64-linux-gnu/libevent-2.1.so.6
#11 0x00007f92234e9ab9 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#12 0x00007f92234e5da8 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#13 0x00007f922350277b in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#14 0x00007f922351a4d6 in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#15 0x00007f92235165eb in  () at
/usr/lib/x86_64-linux-gnu/libQt5WebEngineCore.so.5
#16 0x00007f922e6776db in start_thread (arg=3D0x7f91d2079700) at
pthread_create.c:463
#17 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 9 (Thread 0x7f91d3fff700 (LWP 3037)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x55ed996f9390) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x55ed996f9340, cond=3D0x55ed996f9368) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x55ed996f9368,
mutex=3D0x55ed996f9340) at pthread_cond_wait.c:655
#3  0x00007f923948d59b in QWaitCondition::wait(QMutex*, unsigned long) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007f9239485c0b in QSemaphore::acquire(int) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007f91dd1cb80c in  () at
/usr/lib/x86_64-linux-gnu/qt5/plugins/texttospeech/libqttexttospeech_flite.=
so
#6  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91d3fff700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 8 (Thread 0x7f91de074700 (LWP 3035)):
#0  0x00007f922e67f035 in __GI___pthread_getspecific (key=3D7) at
pthread_getspecific.c:31
#1  0x00007f922ca49680 in g_thread_self () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca216cd in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007f92396689ea in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91de074700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 7 (Thread 0x7f91e73a1700 (LWP 3032)):
#0  0x00007f9238d760b4 in __GI___libc_read (fd=3D16, buf=3D0x7f91e73a0810,
nbytes=3D16) at ../sysdeps/unix/sysv/linux/read.c:27
#1  0x00007f922ca662d0 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca210b7 in g_main_context_check () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f922ca21570 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#4  0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#5  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f92396689ea in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#8  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#9  0x00007f922e6776db in start_thread (arg=3D0x7f91e73a1700) at
pthread_create.c:463
#10 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 6 (Thread 0x7f91e7ba2700 (LWP 3031)):
#0  0x00007f9238d7abf9 in __GI___poll (fds=3D0x7f91e0003ce0, nfds=3D1, time=
out=3D-1)
at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x00007f922ca215c9 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007f92396689ea in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91e7ba2700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 5 (Thread 0x7f91f4c25700 (LWP 3030)):
#0  0x00007f922ca20e18 in g_main_context_check () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#1  0x00007f922ca21570 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007f92396689ea in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f922e6776db in start_thread (arg=3D0x7f91f4c25700) at
pthread_create.c:463
#8  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 4 (Thread 0x7f91f5e36700 (LWP 3029)):
#0  0x00007f9238d760b4 in __GI___libc_read (fd=3D10, buf=3D0x7f91f5e357e0,
nbytes=3D16) at ../sysdeps/unix/sysv/linux/read.c:27
#1  0x00007f922ca662d0 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007f922ca210b7 in g_main_context_check () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007f922ca21570 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#4  0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#5  0x00007f92396c390b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007f92396689ea in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#7  0x00007f923948722a in QThread::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#8  0x00007f9237cbed45 in  () at /usr/lib/x86_64-linux-gnu/libQt5DBus.so.5
#9  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#10 0x00007f922e6776db in start_thread (arg=3D0x7f91f5e36700) at
pthread_create.c:463
#11 0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 3 (Thread 0x7f91f6b17700 (LWP 3028)):
#0  0x00007f922e67d9f3 in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x55ed99345848) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007f922e67d9f3 in __pthread_cond_wait_common (abstime=3D0x0,
mutex=3D0x55ed993457f8, cond=3D0x55ed99345820) at pthread_cond_wait.c:502
#2  0x00007f922e67d9f3 in __pthread_cond_wait (cond=3D0x55ed99345820,
mutex=3D0x55ed993457f8) at pthread_cond_wait.c:655
#3  0x00007f9200398e6b in  () at /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.=
so
#4  0x00007f9200398b97 in  () at /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.=
so
#5  0x00007f922e6776db in start_thread (arg=3D0x7f91f6b17700) at
pthread_create.c:463
#6  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 2 (Thread 0x7f920390b700 (LWP 3027)):
#0  0x00007f9238d7abf9 in __GI___poll (fds=3D0x7f920390a928, nfds=3D1, time=
out=3D-1)
at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x00007f922be50747 in  () at /usr/lib/x86_64-linux-gnu/libxcb.so.1
#2  0x00007f922be5236a in xcb_wait_for_event () at
/usr/lib/x86_64-linux-gnu/libxcb.so.1
#3  0x00007f92056062a9 in  () at /usr/lib/x86_64-linux-gnu/libQt5XcbQpa.so.5
#4  0x00007f923948c16d in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007f922e6776db in start_thread (arg=3D0x7f920390b700) at
pthread_create.c:463
#6  0x00007f9238d8788f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 1 (Thread 0x7f923bc88b80 (LWP 3025)):
[KCrash Handler]
#6  0x00007f9238ca4e97 in __GI_raise (sig=3Dsig&#64;entry=3D6) at
../sysdeps/unix/sysv/linux/raise.c:51
#7  0x00007f9238ca6801 in __GI_abort () at abort.c:79
#8  0x00007f9238c9639a in __assert_fail_base (fmt=3D0x7f923bd43195 &quot;%s=
%s%s:%u:
%s%sZusicherung \302\273%s\302\253 nicht erf\303\274llt.\n%n&quot;,
assertion=3Dassertion&#64;entry=3D0x7f91fbbee608 &quot;kref&quot;, file=3Df=
ile&#64;entry=3D0x7f91fbbee5f2
&quot;../nouveau/pushbuf.c&quot;, line=3Dline&#64;entry=3D723,
function=3Dfunction&#64;entry=3D0x7f91fbbee740 &quot;nouveau_pushbuf_data&q=
uot;) at assert.c:92
#9  0x00007f9238c96412 in __GI___assert_fail (assertion=3D0x7f91fbbee608 &q=
uot;kref&quot;,
file=3D0x7f91fbbee5f2 &quot;../nouveau/pushbuf.c&quot;, line=3D723, functio=
n=3D0x7f91fbbee740
&quot;nouveau_pushbuf_data&quot;) at assert.c:101
#10 0x00007f91fbbec9ad in  () at /usr/lib/x86_64-linux-gnu/libdrm_nouveau.s=
o.2
#11 0x00007f91fbbec966 in nouveau_pushbuf_data () at
/usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2
#12 0x00007f91fbbeca3f in  () at /usr/lib/x86_64-linux-gnu/libdrm_nouveau.s=
o.2
#13 0x00007f91fbbeceaf in  () at /usr/lib/x86_64-linux-gnu/libdrm_nouveau.s=
o.2
#14 0x00007f91fbbeda40 in nouveau_pushbuf_kick () at
/usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2
#15 0x00007f9200669116 in  () at /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.=
so
#16 0x00007f92002d0b8b in  () at /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.=
so
#17 0x00007f920049520a in  () at /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.=
so
#18 0x00007f9201c4fd88 in  () at /usr/lib/x86_64-linux-gnu/libGLX_mesa.so.0
#19 0x00007f9202f038f2 in  () at
/usr/lib/x86_64-linux-gnu/qt5/plugins/xcbglintegrations/libqxcb-glx-integra=
tion.so
#20 0x00007f9239c6600a in QOpenGLContext::swapBuffers(QSurface*) () at
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#21 0x00007f9239f1ab9f in QPlatformBackingStore::composeAndFlush(QWindow*,
QRegion const&amp;, QPoint const&amp;, QPlatformTextureList*, QOpenGLContex=
t*, bool) ()
at /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#22 0x00007f9205625df7 in  () at /usr/lib/x86_64-linux-gnu/libQt5XcbQpa.so.5
#23 0x00007f923a3f5067 in  () at /usr/lib/x86_64-linux-gnu/libQt5Widgets.so=
.5
#24 0x00007f923a3f67e2 in  () at /usr/lib/x86_64-linux-gnu/libQt5Widgets.so=
.5
#25 0x00007f923a3f778f in  () at /usr/lib/x86_64-linux-gnu/libQt5Widgets.so=
.5
#26 0x00007f923a3f8095 in  () at /usr/lib/x86_64-linux-gnu/libQt5Widgets.so=
.5
#27 0x00007f923a40f66f in QWidgetPrivate::syncBackingStore() () at
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#28 0x00007f923a4271a8 in QWidget::event(QEvent*) () at
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#29 0x00007f923a53ac4b in QMainWindow::event(QEvent*) () at
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#30 0x00007f923877ab87 in KMainWindow::event(QEvent*) () at
/usr/lib/x86_64-linux-gnu/libKF5XmlGui.so.5
#31 0x00007f92387bfa05 in KXmlGuiWindow::event(QEvent*) () at
/usr/lib/x86_64-linux-gnu/libKF5XmlGui.so.5
#32 0x00007f923a3e882c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() at /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#33 0x00007f923a3f00f4 in QApplication::notify(QObject*, QEvent*) () at
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#34 0x00007f923966a9a8 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#35 0x00007f923966d11d in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#36 0x00007f92396c42c3 in  () at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#37 0x00007f922ca21417 in g_main_context_dispatch () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#38 0x00007f922ca21650 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#39 0x00007f922ca216dc in g_main_context_iteration () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#40 0x00007f92396c38ef in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#41 0x00007f92396689ea in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#42 0x00007f9239671a84 in QCoreApplication::exec() () at
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#43 0x000055ed988f37cd in  ()
#44 0x00007f9238c87b97 in __libc_start_main (main=3D0x55ed988f2840, argc=3D=
3,
argv=3D0x7fff13144e48, init=3D&lt;optimized out&gt;, fini=3D&lt;optimized o=
ut&gt;,
rtld_fini=3D&lt;optimized out&gt;, stack_end=3D0x7fff13144e38) at ../csu/li=
bc-start.c:310
#45 0x000055ed988f38fa in _start ()


--- end backtrace ----

dpkg -l| grep mesa
ii  libegl-mesa0:amd64                              18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        free implementation of the EGL API -- =
Mesa
vendor library
ii  libegl1-mesa:amd64                              18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        transitional dummy package
ii  libgl1-mesa-dri:amd64                           18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        free implementation of the OpenGL API =
--
DRI modules
ii  libgl1-mesa-dri:i386                            18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        i386         free implementation of the OpenGL API =
--
DRI modules
ii  libgl1-mesa-glx:i386                            18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        i386         transitional dummy package
ii  libglapi-mesa:amd64                             18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        free implementation of the GL API --
shared library
ii  libglapi-mesa:i386                              18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        i386         free implementation of the GL API --
shared library
ii  libglu1-mesa:amd64                              9.0.0-2.1build1=20=20=
=20=20=20=20=20=20=20=20=20=20
                        amd64        Mesa OpenGL utility library (GLU)
ii  libglu1-mesa:i386                               9.0.0-2.1build1=20=20=
=20=20=20=20=20=20=20=20=20=20
                        i386         Mesa OpenGL utility library (GLU)
ii  libglx-mesa0:amd64                              18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        free implementation of the OpenGL API =
--
GLX vendor library
ii  libglx-mesa0:i386                               18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        i386         free implementation of the OpenGL API =
--
GLX vendor library
ii  libosmesa6:amd64                                18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        Mesa Off-screen rendering extension
ii  libosmesa6:i386                                 18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        i386         Mesa Off-screen rendering extension
ii  libwayland-egl1-mesa:amd64                      18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        transitional dummy package
ii  mesa-utils                                      8.4.0-1=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        Miscellaneous Mesa GL utilities
ii  mesa-va-drivers:amd64                           18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        Mesa VA-API video acceleration drivers
ii  mesa-vdpau-drivers:amd64                        18.2.8-0ubuntu0~18.04.2=
=20=20=20=20
                        amd64        Mesa VDPAU video acceleration drivers

dpkg -l| grep xorg
ii  python3-xkit                                    0.5.0ubuntu2=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
                        all          library for the manipulation of xorg.c=
onf
files (Python 3)
ii  xorg                                            1:7.7+19ubuntu7.1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X Window System
ii  xorg-docs-core                                  1:1.7.1-1.1=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
                        all          Core documentation for the X.org X Win=
dow
System
ii  xorg-sgml-doctools                              1:1.11-1=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                        all          Common tools for building X.Org SGML
documentation
ii  xserver-xorg                                    1:7.7+19ubuntu7.1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X server
ii  xserver-xorg-core                               2:1.19.6-1ubuntu4.2=20=
=20=20=20=20=20=20=20
                        amd64        Xorg X server - core server
ii  xserver-xorg-input-all                          1:7.7+19ubuntu7.1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- input driver metapac=
kage
ii  xserver-xorg-input-evdev                        1:2.10.5-1ubuntu1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- evdev input driver
ii  xserver-xorg-input-libinput                     0.27.1-1=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- libinput input driver
ii  xserver-xorg-input-synaptics                    1.9.0-1ubuntu1=20=20=20=
=20=20=20=20=20=20=20=20=20=20
                        amd64        Synaptics TouchPad driver for X.Org se=
rver
ii  xserver-xorg-input-wacom                        1:0.36.1-0ubuntu1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- Wacom input driver
ii  xserver-xorg-legacy                             2:1.19.6-1ubuntu4.2=20=
=20=20=20=20=20=20=20
                        amd64        setuid root Xorg server wrapper
ii  xserver-xorg-video-all                          1:7.7+19ubuntu7.1=20=20=
=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- output driver
metapackage
ii  xserver-xorg-video-amdgpu                       18.0.1-1=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- AMDGPU display driver
ii  xserver-xorg-video-ati                          1:18.0.1-1=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- AMD/ATI display driv=
er
wrapper
ii  xserver-xorg-video-fbdev                        1:0.4.4-1build6=20=20=
=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- fbdev display driver
ii  xserver-xorg-video-intel                        2:2.99.917+git20171229-=
1=20=20=20
                        amd64        X.Org X server -- Intel i8xx, i9xx dis=
play
driver
ii  xserver-xorg-video-nouveau                      1:1.0.15-2=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- Nouveau display driv=
er=20=20=20
ii  xserver-xorg-video-qxl                          0.1.5-2build1=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- QXL display driver=
=20=20=20=20=20=20=20
ii  xserver-xorg-video-radeon                       1:18.0.1-1=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- AMD/ATI Radeon displ=
ay
driver=20=20=20=20=20=20
ii  xserver-xorg-video-vesa                         1:2.3.4-1build3=20=20=
=20=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- VESA display driver=
=20=20=20=20=20=20
ii  xserver-xorg-video-vmware                       1:13.2.1-1build1=20=20=
=20=20=20=20=20=20=20=20=20
                        amd64        X.Org X server -- VMware display drive=
r</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15597644210.b872418C.5388--

--===============0016156462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0016156462==--
