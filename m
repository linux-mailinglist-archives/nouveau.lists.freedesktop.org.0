Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE825714A
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 21:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D5A6E4FB;
	Wed, 26 Jun 2019 19:05:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF4416E4F0
 for <nouveau@lists.freedesktop.org>; Wed, 26 Jun 2019 19:05:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EB7A572167; Wed, 26 Jun 2019 19:05:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 26 Jun 2019 19:05:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: hgcoin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100567-8800-AFzPIZkKBT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100567-8800@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
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
Content-Type: multipart/mixed; boundary="===============0924778281=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0924778281==
Content-Type: multipart/alternative; boundary="15615759044.2C8CcFf6.9242"
Content-Transfer-Encoding: 7bit


--15615759044.2C8CcFf6.9242
Date: Wed, 26 Jun 2019 19:05:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #35 from Harry Coin <hgcoin@gmail.com> ---
On 'disco' aka:
uname -a
Linux ceo1homenx 5.0.0-19-generic #20-Ubuntu SMP Wed Jun 19 17:04:04 UTC 20=
19
x86_64 x86_64 x86_64 GNU/Linux

The following trace shows a nouveau problem, then two mintues later a kernel
lock that requires a power cycle to recover from.   This is a system that h=
as
two graphics cards with all the available monitor ports (3) used.   These h=
ard
lockups happen two to four times per day.  This latest one was under a no l=
oad
condition.  I walked away from a system with an email and firefox ap up.  An
hour or so later I return to a locked system. It's becoming unusable.  Deta=
il:
---

        #6

This is against disco, crashed not an hour ago. Detail:

Jun 26 12:17:03 ceo1homenx btrbk: finished success - - - -
Jun 26 12:18:21 ceo1homenx systemd[1]: Starting Cleanup of Temporary
Directories...
Jun 26 12:18:21 ceo1homenx systemd-tmpfiles[11589]:
[/usr/lib/tmpfiles.d/spice-vdagentd.conf:2] Line references path below lega=
cy
directory /var/run/, updating /var/run/spice-vdagentd =E2=86=92 /run/spice-=
vdagentd;
please update the tmpfiles.d/
 drop-in file accordingly.
Jun 26 12:18:21 ceo1homenx systemd[1]: systemd-tmpfiles-clean.service:
Succeeded.
Jun 26 12:18:21 ceo1homenx systemd[1]: Started Cleanup of Temporary
Directories.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066176] INFO: task kworker/u16:9:=
7088
blocked for more than 120 seconds.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066178] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:23:15 ceo1homenx kernel: [87603.066179] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066180] kworker/u16:9 D 0 7088 2
0x80000000
Jun 26 12:23:15 ceo1homenx kernel: [87603.066211] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066211] Call Trace:
Jun 26 12:23:15 ceo1homenx kernel: [87603.066216] __schedule+0x2d0/0x840
Jun 26 12:23:15 ceo1homenx kernel: [87603.066238] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066239] schedule+0x2c/0x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066240] schedule_timeout+0x258/0x=
360
Jun 26 12:23:15 ceo1homenx kernel: [87603.066252] ?
__drm_crtc_commit_free+0x12/0x20 [drm]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066272] ?
nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066274]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:23:15 ceo1homenx kernel: [87603.066275] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066276]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:23:15 ceo1homenx kernel: [87603.066281]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066301]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066303] ? __switch_to+0x96/0x4e0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066303] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066322]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066324] process_one_work+0x20f/0x=
410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066325] worker_thread+0x34/0x400
Jun 26 12:23:15 ceo1homenx kernel: [87603.066327] kthread+0x120/0x140
Jun 26 12:23:15 ceo1homenx kernel: [87603.066327] ?
process_one_work+0x410/0x410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066329] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066329] ret_from_fork+0x35/0x40
Jun 26 12:23:15 ceo1homenx kernel: [87603.066338] INFO: task kworker/u16:8:=
9307
blocked for more than 120 seconds.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066339] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:23:15 ceo1homenx kernel: [87603.066340] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066340] kworker/u16:8 D 0 9307 2
0x80000000
Jun 26 12:23:15 ceo1homenx kernel: [87603.066360] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066361] Call Trace:
Jun 26 12:23:15 ceo1homenx kernel: [87603.066362] __schedule+0x2d0/0x840
Jun 26 12:23:15 ceo1homenx kernel: [87603.066381] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066383] schedule+0x2c/0x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066384] schedule_timeout+0x258/0x=
360
Jun 26 12:23:15 ceo1homenx kernel: [87603.066385] ? __slab_free+0x225/0x340
Jun 26 12:23:15 ceo1homenx kernel: [87603.066387]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:23:15 ceo1homenx kernel: [87603.066387] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066388]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:23:15 ceo1homenx kernel: [87603.066392]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066411]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066412] ? __switch_to+0x96/0x4e0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066412] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066431]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066431] process_one_work+0x20f/0x=
410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066432] worker_thread+0x34/0x400
Jun 26 12:23:15 ceo1homenx kernel: [87603.066434] kthread+0x120/0x140
Jun 26 12:23:15 ceo1homenx kernel: [87603.066434] ?
process_one_work+0x410/0x410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066436] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066436] ret_from_fork+0x35/0x40
Jun 26 12:23:15 ceo1homenx kernel: [87603.066439] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:23:15 ceo1homenx kernel: [87603.066439] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066440] kworker/u16:7 D 0 10297 2
0x80000000
Jun 26 12:23:15 ceo1homenx kernel: [87603.066458] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066459] Call Trace:
Jun 26 12:23:15 ceo1homenx kernel: [87603.066460] __schedule+0x2d0/0x840
Jun 26 12:23:15 ceo1homenx kernel: [87603.066479] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066480] schedule+0x2c/0x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066481] schedule_timeout+0x258/0x=
360
Jun 26 12:23:15 ceo1homenx kernel: [87603.066482] ? __slab_free+0x225/0x340
Jun 26 12:23:15 ceo1homenx kernel: [87603.066483]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:23:15 ceo1homenx kernel: [87603.066484] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066485]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:23:15 ceo1homenx kernel: [87603.066489]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066507]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066508] ? __switch_to+0x96/0x4e0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066509] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066527]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066528] process_one_work+0x20f/0x=
410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066529] worker_thread+0x34/0x400
Jun 26 12:23:15 ceo1homenx kernel: [87603.066530] kthread+0x120/0x140
Jun 26 12:23:15 ceo1homenx kernel: [87603.066531] ?
process_one_work+0x410/0x410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066532] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066533] ret_from_fork+0x35/0x40
Jun 26 12:25:01 ceo1homenx CRON[11952]: (root) CMD (command -v debian-sa1 >
/dev/null && debian-sa1 1 1)
Jun 26 12:25:16 ceo1homenx kernel: [87723.895077] INFO: task kworker/u16:9:=
7088
blocked for more than 120 seconds.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895079] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:25:16 ceo1homenx kernel: [87723.895079] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895080] kworker/u16:9 D 0 7088 2
0x80000000
Jun 26 12:25:16 ceo1homenx kernel: [87723.895111] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895112] Call Trace:
Jun 26 12:25:16 ceo1homenx kernel: [87723.895115] __schedule+0x2d0/0x840
Jun 26 12:25:16 ceo1homenx kernel: [87723.895138] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895139] schedule+0x2c/0x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895141] schedule_timeout+0x258/0x=
360
Jun 26 12:25:16 ceo1homenx kernel: [87723.895152] ?
__drm_crtc_commit_free+0x12/0x20 [drm]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895173] ?
nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895174]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:25:16 ceo1homenx kernel: [87723.895175] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895176]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:25:16 ceo1homenx kernel: [87723.895182]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895201]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895203] ? __switch_to+0x96/0x4e0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895204] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895223]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895225] process_one_work+0x20f/0x=
410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895226] worker_thread+0x34/0x400
Jun 26 12:25:16 ceo1homenx kernel: [87723.895227] kthread+0x120/0x140
Jun 26 12:25:16 ceo1homenx kernel: [87723.895228] ?
process_one_work+0x410/0x410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895229] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895230] ret_from_fork+0x35/0x40
Jun 26 12:25:16 ceo1homenx kernel: [87723.895239] INFO: task kworker/u16:8:=
9307
blocked for more than 120 seconds.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895240] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:25:16 ceo1homenx kernel: [87723.895241] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895241] kworker/u16:8 D 0 9307 2
0x80000000
Jun 26 12:25:16 ceo1homenx kernel: [87723.895261] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895262] Call Trace:
Jun 26 12:25:16 ceo1homenx kernel: [87723.895263] __schedule+0x2d0/0x840
Jun 26 12:25:16 ceo1homenx kernel: [87723.895283] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895284] schedule+0x2c/0x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895285] schedule_timeout+0x258/0x=
360
Jun 26 12:25:16 ceo1homenx kernel: [87723.895287] ? __slab_free+0x225/0x340
Jun 26 12:25:16 ceo1homenx kernel: [87723.895288]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:25:16 ceo1homenx kernel: [87723.895289] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895290]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:25:16 ceo1homenx kernel: [87723.895294]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895312]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895313] ? __switch_to+0x96/0x4e0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895314] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895333]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895334] process_one_work+0x20f/0x=
410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895335] worker_thread+0x34/0x400
Jun 26 12:25:16 ceo1homenx kernel: [87723.895336] kthread+0x120/0x140
Jun 26 12:25:16 ceo1homenx kernel: [87723.895337] ?
process_one_work+0x410/0x410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895338] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895338] ret_from_fork+0x35/0x40
Jun 26 12:25:16 ceo1homenx kernel: [87723.895340] INFO: task
kworker/u16:7:10297 blocked for more than 120 seconds.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895341] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:25:16 ceo1homenx kernel: [87723.895341] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895342] kworker/u16:7 D 0 10297 2
0x80000000
Jun 26 12:25:16 ceo1homenx kernel: [87723.895361] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895361] Call Trace:
Jun 26 12:25:16 ceo1homenx kernel: [87723.895363] __schedule+0x2d0/0x840
Jun 26 12:25:16 ceo1homenx kernel: [87723.895381] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895382] schedule+0x2c/0x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895383] schedule_timeout+0x258/0x=
360
Jun 26 12:25:16 ceo1homenx kernel: [87723.895385] ? __slab_free+0x225/0x340
Jun 26 12:25:16 ceo1homenx kernel: [87723.895386]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:25:16 ceo1homenx kernel: [87723.895387] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895388]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:25:16 ceo1homenx kernel: [87723.895391]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895410]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895411] ? __switch_to+0x96/0x4e0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895411] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895430]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895431] process_one_work+0x20f/0x=
410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895431] worker_thread+0x34/0x400
Jun 26 12:25:16 ceo1homenx kernel: [87723.895433] kthread+0x120/0x140
Jun 26 12:25:16 ceo1homenx kernel: [87723.895433] ?
process_one_work+0x410/0x410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895435] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895435] ret_from_fork+0x35/0x40
Jun 26 12:27:17 ceo1homenx kernel: [87844.724604] INFO: task kworker/u16:9:=
7088
blocked for more than 120 seconds.
Jun 26 12:27:17 ceo1homenx kernel: [87844.724611] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:27:17 ceo1homenx kernel: [87844.724614] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jun 26 12:27:17 ceo1homenx kernel: [87844.724617] kworker/u16:9 D 0 7088 2
0x80000000
Jun 26 12:27:17 ceo1homenx kernel: [87844.724736] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.724739] Call Trace:
Jun 26 12:27:17 ceo1homenx kernel: [87844.724752] __schedule+0x2d0/0x840
Jun 26 12:27:17 ceo1homenx kernel: [87844.724856] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.724862] schedule+0x2c/0x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.724868] schedule_timeout+0x258/0x=
360
Jun 26 12:27:17 ceo1homenx kernel: [87844.724907] ?
__drm_crtc_commit_free+0x12/0x20 [drm]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725005] ?
nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725012]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:27:17 ceo1homenx kernel: [87844.725017] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:27:17 ceo1homenx kernel: [87844.725022]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:27:17 ceo1homenx kernel: [87844.725041]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725136]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725141] ? __switch_to+0x96/0x4e0
Jun 26 12:27:17 ceo1homenx kernel: [87844.725145] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:27:17 ceo1homenx kernel: [87844.725237]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725243] process_one_work+0x20f/0x=
410
Jun 26 12:27:17 ceo1homenx kernel: [87844.725247] worker_thread+0x34/0x400
Jun 26 12:27:17 ceo1homenx kernel: [87844.725254] kthread+0x120/0x140
Jun 26 12:27:17 ceo1homenx kernel: [87844.725258] ?
process_one_work+0x410/0x410
Jun 26 12:27:17 ceo1homenx kernel: [87844.725263] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.725267] ret_from_fork+0x35/0x40
Jun 26 12:27:17 ceo1homenx kernel: [87844.725291] INFO: task kworker/u16:8:=
9307
blocked for more than 120 seconds.
Jun 26 12:27:17 ceo1homenx kernel: [87844.725296] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:27:17 ceo1homenx kernel: [87844.725298] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jun 26 12:27:17 ceo1homenx kernel: [87844.725301] kworker/u16:8 D 0 9307 2
0x80000000
Jun 26 12:27:17 ceo1homenx kernel: [87844.725396] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725398] Call Trace:
Jun 26 12:27:17 ceo1homenx kernel: [87844.725405] __schedule+0x2d0/0x840
Jun 26 12:27:17 ceo1homenx kernel: [87844.725495] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725502] schedule+0x2c/0x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.725507] schedule_timeout+0x258/0x=
360
Jun 26 12:27:17 ceo1homenx kernel: [87844.725514] ? __slab_free+0x225/0x340
Jun 26 12:27:17 ceo1homenx kernel: [87844.725519]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:27:17 ceo1homenx kernel: [87844.725523] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:27:17 ceo1homenx kernel: [87844.725528]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:27:17 ceo1homenx kernel: [87844.725546]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725635]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725639] ? __switch_to+0x96/0x4e0
Jun 26 12:27:17 ceo1homenx kernel: [87844.725643] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:27:17 ceo1homenx kernel: [87844.725732]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725736] process_one_work+0x20f/0x=
410
Jun 26 12:27:17 ceo1homenx kernel: [87844.725741] worker_thread+0x34/0x400
Jun 26 12:27:17 ceo1homenx kernel: [87844.725746] kthread+0x120/0x140
Jun 26 12:27:17 ceo1homenx kernel: [87844.725750] ?
process_one_work+0x410/0x410
Jun 26 12:27:17 ceo1homenx kernel: [87844.725755] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.725759] ret_from_fork+0x35/0x40
Jun 26 12:27:17 ceo1homenx kernel: [87844.725765] INFO: task
kworker/u16:7:10297 blocked for more than 120 seconds.
Jun 26 12:27:17 ceo1homenx kernel: [87844.725769] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:27:17 ceo1homenx kernel: [87844.725771] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jun 26 12:27:17 ceo1homenx kernel: [87844.725774] kworker/u16:7 D 0 10297 2
0x80000000
Jun 26 12:27:17 ceo1homenx kernel: [87844.725885] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725890] Call Trace:
Jun 26 12:27:17 ceo1homenx kernel: [87844.725902] __schedule+0x2d0/0x840
Jun 26 12:27:17 ceo1homenx kernel: [87844.726014] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.726022] schedule+0x2c/0x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.726029] schedule_timeout+0x258/0x=
360
Jun 26 12:27:17 ceo1homenx kernel: [87844.726038] ? __slab_free+0x225/0x340
Jun 26 12:27:17 ceo1homenx kernel: [87844.726044]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:27:17 ceo1homenx kernel: [87844.726050] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:27:17 ceo1homenx kernel: [87844.726056]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:27:17 ceo1homenx kernel: [87844.726075]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:27:17 ceo1homenx kernel: [87844.726165]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.726169] ? __switch_to+0x96/0x4e0
Jun 26 12:27:17 ceo1homenx kernel: [87844.726172] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:27:17 ceo1homenx kernel: [87844.726260]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.726265] process_one_work+0x20f/0x=
410
Jun 26 12:27:17 ceo1homenx kernel: [87844.726269] worker_thread+0x34/0x400
Jun 26 12:27:17 ceo1homenx kernel: [87844.726276] kthread+0x120/0x140
Jun 26 12:27:17 ceo1homenx kernel: [87844.726279] ?
process_one_work+0x410/0x410
Jun 26 12:27:17 ceo1homenx kernel: [87844.726285] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.726288] ret_from_fork+0x35/0x40
Jun 26 12:29:18 ceo1homenx kernel: [87965.557909] INFO: task kworker/u16:9:=
7088
blocked for more than 120 seconds.
Jun 26 12:29:18 ceo1homenx kernel: [87965.557916] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:29:18 ceo1homenx kernel: [87965.557919] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jun 26 12:29:18 ceo1homenx kernel: [87965.557922] kworker/u16:9 D 0 7088 2
0x80000000
Jun 26 12:29:18 ceo1homenx kernel: [87965.558041] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558044] Call Trace:
Jun 26 12:29:18 ceo1homenx kernel: [87965.558056] __schedule+0x2d0/0x840
Jun 26 12:29:18 ceo1homenx kernel: [87965.558160] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558167] schedule+0x2c/0x70
Jun 26 12:29:18 ceo1homenx kernel: [87965.558172] schedule_timeout+0x258/0x=
360
Jun 26 12:29:18 ceo1homenx kernel: [87965.558213] ?
__drm_crtc_commit_free+0x12/0x20 [drm]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558309] ?
nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558316]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:29:18 ceo1homenx kernel: [87965.558320] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:29:18 ceo1homenx kernel: [87965.558325]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:29:18 ceo1homenx kernel: [87965.558344]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558437]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558443] ? __switch_to+0x96/0x4e0
Jun 26 12:29:18 ceo1homenx kernel: [87965.558446] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:29:18 ceo1homenx kernel: [87965.558536]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558542] process_one_work+0x20f/0x=
410
Jun 26 12:29:18 ceo1homenx kernel: [87965.558547] worker_thread+0x34/0x400
Jun 26 12:29:18 ceo1homenx kernel: [87965.558553] kthread+0x120/0x140
Jun 26 12:29:18 ceo1homenx kernel: [87965.558557] ?
process_one_work+0x410/0x410
Jun 26 12:29:18 ceo1homenx kernel: [87965.558563] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:29:18 ceo1homenx kernel: [87965.558567] ret_from_fork+0x35/0x40
Jun 26 12:30:01 ceo1homenx CRON[12207]: (root) CMD ([ -x /etc/init.d/anacro=
n ]
&& if [ ! -d /run/systemd/system ]; then /usr/sbin/invoke-rc.d anacron start
>/dev/null; fi)
Jun 26 12:33:21 ceo1homenx systemd[1]: Started Run anacron jobs.
Jun 26 12:33:21 ceo1homenx anacron[12372]: Anacron 2.3 started on 2019-06-26
Jun 26 12:33:21 ceo1homenx anacron[12372]: Normal exit (0 jobs run)
Jun 26 12:33:21 ceo1homenx systemd[1]: anacron.service: Succeeded.
Jun 26 12:35:02 ceo1homenx CRON[12477]: (root) CMD (command -v debian-sa1 >
/dev/null && debian-sa1 1 1)
Jun 26 12:39:01 ceo1homenx systemd[1]: Starting Clean php session files...
Jun 26 12:39:01 ceo1homenx CRON[12710]: (root) CMD ( [ -x
/usr/lib/php/sessionclean ] && if [ ! -d /run/systemd/system ]; then
/usr/lib/php/sessionclean; fi)
Jun 26 12:39:01 ceo1homenx systemd[1]: phpsessionclean.service: Succeeded.
Jun 26 12:39:01 ceo1homenx systemd[1]: Started Clean php session files.
Jun 26 12:45:02 ceo1homenx CRON[13049]: (root) CMD (command -v debian-sa1 >
/dev/null && debian-sa1 1 1)
Jun 26 12:55:02 ceo1homenx CRON[13571]: (root) CMD (command -v debian-sa1 >
/dev/null && debian-sa1 1 1)
Jun 26 12:56:20 ceo1homenx kernel: [89587.485877] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx kernel: [89591.781878] nouveau 0000:01:00.0: fif=
o:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Jun 26 12:56:24 ceo1homenx kernel: [89591.781897] nouveau 0000:01:00.0: fif=
o:
runlist 0: scheduled for recovery
Jun 26 12:56:24 ceo1homenx kernel: [89591.781918] nouveau 0000:01:00.0: fif=
o:
channel 5: killed
Jun 26 12:56:24 ceo1homenx kernel: [89591.781926] nouveau 0000:01:00.0: fif=
o:
engine 0: scheduled for recovery
Jun 26 12:56:24 ceo1homenx kernel: [89591.782531] nouveau 0000:01:00.0:
Xorg[3086]: channel 5 killed!
Jun 26 12:56:24 ceo1homenx kernel: [89591.784954] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx kernel: [89591.787346] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx kernel: [89591.791222] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx kernel: [89591.799169] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx kernel: [89591.799874] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx dbus-daemon[1027]: [system] Activating via syste=
md:
service name=3D'org.freedesktop.PackageKit' unit=3D'packagekit.service' req=
uested
by ':1.270' (uid=3D1000 pid=3D3346 comm=3D"/usr/bin/plasmashell " label=3D"=
unconfined")
Jun 26 12:56:24 ceo1homenx systemd[1]: Starting PackageKit Daemon...
Jun 26 12:56:24 ceo1homenx PackageKit: daemon start
Jun 26 12:56:24 ceo1homenx dbus-daemon[1027]: [system] Successfully activat=
ed
service 'org.freedesktop.PackageKit'
Jun 26 12:56:24 ceo1homenx systemd[1]: Started PackageKit Daemon.
Jun 26 13:01:30 ceo1homenx PackageKit: daemon quit
Jun 26 13:01:30 ceo1homenx systemd[1]: packagekit.service: Main process exi=
ted,
code=3Dkilled, status=3D15/TERM
Jun 26 13:01:30 ceo1homenx systemd[1]: packagekit.service: Succeeded.
Jun 26 13:05:01 ceo1homenx CRON[14159]: (root) CMD (command -v debian-sa1 >
/dev/null && debian-sa1 1 1)
Jun 26 13:09:02 ceo1homenx systemd[1]: Starting Clean php session files...
Jun 26 13:09:02 ceo1homenx CRON[14381]: (root) CMD ( [ -x
/usr/lib/php/sessionclean ] && if [ ! -d /run/systemd/system ]; then
/usr/lib/php/sessionclean; fi)
Jun 26 13:09:02 ceo1homenx systemd[1]: phpsessionclean.service: Succeeded.
Jun 26 13:09:02 ceo1homenx systemd[1]: Started Clean php session files.
Jun 26 13:15:02 ceo1homenx CRON[14748]: (root) CMD (command -v debian-sa1 >
/dev/null && debian-sa1 1 1)
Jun 26 13:17:01 ceo1homenx CRON[14851]: (root) CMD ( cd / && run-parts --re=
port
/etc/cron.hourly)
Jun 26 13:17:01 ceo1homenx btrbk: startup v0.27.1 - - - # btrbk command line
client, version 0.27.1
Jun 26 13:17:01 ceo1homenx btrbk: snapshot starting
/snapshots/home_snapshots/@home.20190626T1317 /snapshots/@home - -
Jun 26 13:17:03 ceo1homenx btrbk: snapshot success
/snapshots/home_snapshots/@home.20190626T1317 /snapshots/@home - -
Jun 26 13:17:03 ceo1homenx btrbk: delete_snapshot starting
/snapshots/home_snapshots/@home.20190622T1217 - - -
Jun 26 13:17:03 ceo1homenx btrbk: delete_snapshot success
/snapshots/home_snapshots/@home.20190622T1217 - - -
Jun 26 13:17:03 ceo1homenx btrbk: finished success - - - -

-- Hard Lock-- power cycle reboot the only possible fix.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15615759044.2C8CcFf6.9242
Date: Wed, 26 Jun 2019 19:05:04 +0000
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
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c35">Comme=
nt # 35</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hgcoin&#64;gmail.com" title=3D"Harry Coin &lt;hgcoin&#64;gmail.com&gt;"> <s=
pan class=3D"fn">Harry Coin</span></a>
</span></b>
        <pre>On 'disco' aka:
uname -a
Linux ceo1homenx 5.0.0-19-generic #20-Ubuntu SMP Wed Jun 19 17:04:04 UTC 20=
19
x86_64 x86_64 x86_64 GNU/Linux

The following trace shows a nouveau problem, then two mintues later a kernel
lock that requires a power cycle to recover from.   This is a system that h=
as
two graphics cards with all the available monitor ports (3) used.   These h=
ard
lockups happen two to four times per day.  This latest one was under a no l=
oad
condition.  I walked away from a system with an email and firefox ap up.  An
hour or so later I return to a locked system. It's becoming unusable.  Deta=
il:
---

        #6

This is against disco, crashed not an hour ago. Detail:

Jun 26 12:17:03 ceo1homenx btrbk: finished success - - - -
Jun 26 12:18:21 ceo1homenx systemd[1]: Starting Cleanup of Temporary
Directories...
Jun 26 12:18:21 ceo1homenx systemd-tmpfiles[11589]:
[/usr/lib/tmpfiles.d/spice-vdagentd.conf:2] Line references path below lega=
cy
directory /var/run/, updating /var/run/spice-vdagentd =E2=86=92 /run/spice-=
vdagentd;
please update the tmpfiles.d/
 drop-in file accordingly.
Jun 26 12:18:21 ceo1homenx systemd[1]: systemd-tmpfiles-clean.service:
Succeeded.
Jun 26 12:18:21 ceo1homenx systemd[1]: Started Cleanup of Temporary
Directories.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066176] INFO: task kworker/u16:9:=
7088
blocked for more than 120 seconds.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066178] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:23:15 ceo1homenx kernel: [87603.066179] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066180] kworker/u16:9 D 0 7088 2
0x80000000
Jun 26 12:23:15 ceo1homenx kernel: [87603.066211] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066211] Call Trace:
Jun 26 12:23:15 ceo1homenx kernel: [87603.066216] __schedule+0x2d0/0x840
Jun 26 12:23:15 ceo1homenx kernel: [87603.066238] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066239] schedule+0x2c/0x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066240] schedule_timeout+0x258/0x=
360
Jun 26 12:23:15 ceo1homenx kernel: [87603.066252] ?
__drm_crtc_commit_free+0x12/0x20 [drm]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066272] ?
nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066274]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:23:15 ceo1homenx kernel: [87603.066275] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066276]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:23:15 ceo1homenx kernel: [87603.066281]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066301]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066303] ? __switch_to+0x96/0x4e0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066303] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066322]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066324] process_one_work+0x20f/0x=
410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066325] worker_thread+0x34/0x400
Jun 26 12:23:15 ceo1homenx kernel: [87603.066327] kthread+0x120/0x140
Jun 26 12:23:15 ceo1homenx kernel: [87603.066327] ?
process_one_work+0x410/0x410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066329] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066329] ret_from_fork+0x35/0x40
Jun 26 12:23:15 ceo1homenx kernel: [87603.066338] INFO: task kworker/u16:8:=
9307
blocked for more than 120 seconds.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066339] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:23:15 ceo1homenx kernel: [87603.066340] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066340] kworker/u16:8 D 0 9307 2
0x80000000
Jun 26 12:23:15 ceo1homenx kernel: [87603.066360] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066361] Call Trace:
Jun 26 12:23:15 ceo1homenx kernel: [87603.066362] __schedule+0x2d0/0x840
Jun 26 12:23:15 ceo1homenx kernel: [87603.066381] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066383] schedule+0x2c/0x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066384] schedule_timeout+0x258/0x=
360
Jun 26 12:23:15 ceo1homenx kernel: [87603.066385] ? __slab_free+0x225/0x340
Jun 26 12:23:15 ceo1homenx kernel: [87603.066387]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:23:15 ceo1homenx kernel: [87603.066387] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066388]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:23:15 ceo1homenx kernel: [87603.066392]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066411]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066412] ? __switch_to+0x96/0x4e0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066412] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066431]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066431] process_one_work+0x20f/0x=
410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066432] worker_thread+0x34/0x400
Jun 26 12:23:15 ceo1homenx kernel: [87603.066434] kthread+0x120/0x140
Jun 26 12:23:15 ceo1homenx kernel: [87603.066434] ?
process_one_work+0x410/0x410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066436] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066436] ret_from_fork+0x35/0x40
Jun 26 12:23:15 ceo1homenx kernel: [87603.066439] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:23:15 ceo1homenx kernel: [87603.066439] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Jun 26 12:23:15 ceo1homenx kernel: [87603.066440] kworker/u16:7 D 0 10297 2
0x80000000
Jun 26 12:23:15 ceo1homenx kernel: [87603.066458] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066459] Call Trace:
Jun 26 12:23:15 ceo1homenx kernel: [87603.066460] __schedule+0x2d0/0x840
Jun 26 12:23:15 ceo1homenx kernel: [87603.066479] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066480] schedule+0x2c/0x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066481] schedule_timeout+0x258/0x=
360
Jun 26 12:23:15 ceo1homenx kernel: [87603.066482] ? __slab_free+0x225/0x340
Jun 26 12:23:15 ceo1homenx kernel: [87603.066483]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:23:15 ceo1homenx kernel: [87603.066484] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066485]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:23:15 ceo1homenx kernel: [87603.066489]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066507]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066508] ? __switch_to+0x96/0x4e0
Jun 26 12:23:15 ceo1homenx kernel: [87603.066509] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066527]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:23:15 ceo1homenx kernel: [87603.066528] process_one_work+0x20f/0x=
410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066529] worker_thread+0x34/0x400
Jun 26 12:23:15 ceo1homenx kernel: [87603.066530] kthread+0x120/0x140
Jun 26 12:23:15 ceo1homenx kernel: [87603.066531] ?
process_one_work+0x410/0x410
Jun 26 12:23:15 ceo1homenx kernel: [87603.066532] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:23:15 ceo1homenx kernel: [87603.066533] ret_from_fork+0x35/0x40
Jun 26 12:25:01 ceo1homenx CRON[11952]: (root) CMD (command -v debian-sa1 &=
gt;
/dev/null &amp;&amp; debian-sa1 1 1)
Jun 26 12:25:16 ceo1homenx kernel: [87723.895077] INFO: task kworker/u16:9:=
7088
blocked for more than 120 seconds.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895079] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:25:16 ceo1homenx kernel: [87723.895079] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895080] kworker/u16:9 D 0 7088 2
0x80000000
Jun 26 12:25:16 ceo1homenx kernel: [87723.895111] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895112] Call Trace:
Jun 26 12:25:16 ceo1homenx kernel: [87723.895115] __schedule+0x2d0/0x840
Jun 26 12:25:16 ceo1homenx kernel: [87723.895138] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895139] schedule+0x2c/0x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895141] schedule_timeout+0x258/0x=
360
Jun 26 12:25:16 ceo1homenx kernel: [87723.895152] ?
__drm_crtc_commit_free+0x12/0x20 [drm]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895173] ?
nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895174]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:25:16 ceo1homenx kernel: [87723.895175] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895176]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:25:16 ceo1homenx kernel: [87723.895182]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895201]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895203] ? __switch_to+0x96/0x4e0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895204] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895223]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895225] process_one_work+0x20f/0x=
410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895226] worker_thread+0x34/0x400
Jun 26 12:25:16 ceo1homenx kernel: [87723.895227] kthread+0x120/0x140
Jun 26 12:25:16 ceo1homenx kernel: [87723.895228] ?
process_one_work+0x410/0x410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895229] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895230] ret_from_fork+0x35/0x40
Jun 26 12:25:16 ceo1homenx kernel: [87723.895239] INFO: task kworker/u16:8:=
9307
blocked for more than 120 seconds.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895240] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:25:16 ceo1homenx kernel: [87723.895241] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895241] kworker/u16:8 D 0 9307 2
0x80000000
Jun 26 12:25:16 ceo1homenx kernel: [87723.895261] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895262] Call Trace:
Jun 26 12:25:16 ceo1homenx kernel: [87723.895263] __schedule+0x2d0/0x840
Jun 26 12:25:16 ceo1homenx kernel: [87723.895283] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895284] schedule+0x2c/0x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895285] schedule_timeout+0x258/0x=
360
Jun 26 12:25:16 ceo1homenx kernel: [87723.895287] ? __slab_free+0x225/0x340
Jun 26 12:25:16 ceo1homenx kernel: [87723.895288]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:25:16 ceo1homenx kernel: [87723.895289] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895290]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:25:16 ceo1homenx kernel: [87723.895294]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895312]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895313] ? __switch_to+0x96/0x4e0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895314] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895333]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895334] process_one_work+0x20f/0x=
410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895335] worker_thread+0x34/0x400
Jun 26 12:25:16 ceo1homenx kernel: [87723.895336] kthread+0x120/0x140
Jun 26 12:25:16 ceo1homenx kernel: [87723.895337] ?
process_one_work+0x410/0x410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895338] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895338] ret_from_fork+0x35/0x40
Jun 26 12:25:16 ceo1homenx kernel: [87723.895340] INFO: task
kworker/u16:7:10297 blocked for more than 120 seconds.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895341] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:25:16 ceo1homenx kernel: [87723.895341] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Jun 26 12:25:16 ceo1homenx kernel: [87723.895342] kworker/u16:7 D 0 10297 2
0x80000000
Jun 26 12:25:16 ceo1homenx kernel: [87723.895361] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895361] Call Trace:
Jun 26 12:25:16 ceo1homenx kernel: [87723.895363] __schedule+0x2d0/0x840
Jun 26 12:25:16 ceo1homenx kernel: [87723.895381] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895382] schedule+0x2c/0x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895383] schedule_timeout+0x258/0x=
360
Jun 26 12:25:16 ceo1homenx kernel: [87723.895385] ? __slab_free+0x225/0x340
Jun 26 12:25:16 ceo1homenx kernel: [87723.895386]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:25:16 ceo1homenx kernel: [87723.895387] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895388]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:25:16 ceo1homenx kernel: [87723.895391]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895410]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895411] ? __switch_to+0x96/0x4e0
Jun 26 12:25:16 ceo1homenx kernel: [87723.895411] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895430]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:25:16 ceo1homenx kernel: [87723.895431] process_one_work+0x20f/0x=
410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895431] worker_thread+0x34/0x400
Jun 26 12:25:16 ceo1homenx kernel: [87723.895433] kthread+0x120/0x140
Jun 26 12:25:16 ceo1homenx kernel: [87723.895433] ?
process_one_work+0x410/0x410
Jun 26 12:25:16 ceo1homenx kernel: [87723.895435] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:25:16 ceo1homenx kernel: [87723.895435] ret_from_fork+0x35/0x40
Jun 26 12:27:17 ceo1homenx kernel: [87844.724604] INFO: task kworker/u16:9:=
7088
blocked for more than 120 seconds.
Jun 26 12:27:17 ceo1homenx kernel: [87844.724611] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:27:17 ceo1homenx kernel: [87844.724614] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Jun 26 12:27:17 ceo1homenx kernel: [87844.724617] kworker/u16:9 D 0 7088 2
0x80000000
Jun 26 12:27:17 ceo1homenx kernel: [87844.724736] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.724739] Call Trace:
Jun 26 12:27:17 ceo1homenx kernel: [87844.724752] __schedule+0x2d0/0x840
Jun 26 12:27:17 ceo1homenx kernel: [87844.724856] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.724862] schedule+0x2c/0x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.724868] schedule_timeout+0x258/0x=
360
Jun 26 12:27:17 ceo1homenx kernel: [87844.724907] ?
__drm_crtc_commit_free+0x12/0x20 [drm]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725005] ?
nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725012]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:27:17 ceo1homenx kernel: [87844.725017] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:27:17 ceo1homenx kernel: [87844.725022]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:27:17 ceo1homenx kernel: [87844.725041]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725136]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725141] ? __switch_to+0x96/0x4e0
Jun 26 12:27:17 ceo1homenx kernel: [87844.725145] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:27:17 ceo1homenx kernel: [87844.725237]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725243] process_one_work+0x20f/0x=
410
Jun 26 12:27:17 ceo1homenx kernel: [87844.725247] worker_thread+0x34/0x400
Jun 26 12:27:17 ceo1homenx kernel: [87844.725254] kthread+0x120/0x140
Jun 26 12:27:17 ceo1homenx kernel: [87844.725258] ?
process_one_work+0x410/0x410
Jun 26 12:27:17 ceo1homenx kernel: [87844.725263] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.725267] ret_from_fork+0x35/0x40
Jun 26 12:27:17 ceo1homenx kernel: [87844.725291] INFO: task kworker/u16:8:=
9307
blocked for more than 120 seconds.
Jun 26 12:27:17 ceo1homenx kernel: [87844.725296] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:27:17 ceo1homenx kernel: [87844.725298] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Jun 26 12:27:17 ceo1homenx kernel: [87844.725301] kworker/u16:8 D 0 9307 2
0x80000000
Jun 26 12:27:17 ceo1homenx kernel: [87844.725396] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725398] Call Trace:
Jun 26 12:27:17 ceo1homenx kernel: [87844.725405] __schedule+0x2d0/0x840
Jun 26 12:27:17 ceo1homenx kernel: [87844.725495] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725502] schedule+0x2c/0x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.725507] schedule_timeout+0x258/0x=
360
Jun 26 12:27:17 ceo1homenx kernel: [87844.725514] ? __slab_free+0x225/0x340
Jun 26 12:27:17 ceo1homenx kernel: [87844.725519]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:27:17 ceo1homenx kernel: [87844.725523] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:27:17 ceo1homenx kernel: [87844.725528]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:27:17 ceo1homenx kernel: [87844.725546]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725635]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725639] ? __switch_to+0x96/0x4e0
Jun 26 12:27:17 ceo1homenx kernel: [87844.725643] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:27:17 ceo1homenx kernel: [87844.725732]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725736] process_one_work+0x20f/0x=
410
Jun 26 12:27:17 ceo1homenx kernel: [87844.725741] worker_thread+0x34/0x400
Jun 26 12:27:17 ceo1homenx kernel: [87844.725746] kthread+0x120/0x140
Jun 26 12:27:17 ceo1homenx kernel: [87844.725750] ?
process_one_work+0x410/0x410
Jun 26 12:27:17 ceo1homenx kernel: [87844.725755] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.725759] ret_from_fork+0x35/0x40
Jun 26 12:27:17 ceo1homenx kernel: [87844.725765] INFO: task
kworker/u16:7:10297 blocked for more than 120 seconds.
Jun 26 12:27:17 ceo1homenx kernel: [87844.725769] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:27:17 ceo1homenx kernel: [87844.725771] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Jun 26 12:27:17 ceo1homenx kernel: [87844.725774] kworker/u16:7 D 0 10297 2
0x80000000
Jun 26 12:27:17 ceo1homenx kernel: [87844.725885] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.725890] Call Trace:
Jun 26 12:27:17 ceo1homenx kernel: [87844.725902] __schedule+0x2d0/0x840
Jun 26 12:27:17 ceo1homenx kernel: [87844.726014] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.726022] schedule+0x2c/0x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.726029] schedule_timeout+0x258/0x=
360
Jun 26 12:27:17 ceo1homenx kernel: [87844.726038] ? __slab_free+0x225/0x340
Jun 26 12:27:17 ceo1homenx kernel: [87844.726044]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:27:17 ceo1homenx kernel: [87844.726050] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:27:17 ceo1homenx kernel: [87844.726056]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:27:17 ceo1homenx kernel: [87844.726075]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:27:17 ceo1homenx kernel: [87844.726165]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.726169] ? __switch_to+0x96/0x4e0
Jun 26 12:27:17 ceo1homenx kernel: [87844.726172] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:27:17 ceo1homenx kernel: [87844.726260]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:27:17 ceo1homenx kernel: [87844.726265] process_one_work+0x20f/0x=
410
Jun 26 12:27:17 ceo1homenx kernel: [87844.726269] worker_thread+0x34/0x400
Jun 26 12:27:17 ceo1homenx kernel: [87844.726276] kthread+0x120/0x140
Jun 26 12:27:17 ceo1homenx kernel: [87844.726279] ?
process_one_work+0x410/0x410
Jun 26 12:27:17 ceo1homenx kernel: [87844.726285] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:27:17 ceo1homenx kernel: [87844.726288] ret_from_fork+0x35/0x40
Jun 26 12:29:18 ceo1homenx kernel: [87965.557909] INFO: task kworker/u16:9:=
7088
blocked for more than 120 seconds.
Jun 26 12:29:18 ceo1homenx kernel: [87965.557916] Tainted: G W 5.0.0-19-gen=
eric
#20-Ubuntu
Jun 26 12:29:18 ceo1homenx kernel: [87965.557919] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Jun 26 12:29:18 ceo1homenx kernel: [87965.557922] kworker/u16:9 D 0 7088 2
0x80000000
Jun 26 12:29:18 ceo1homenx kernel: [87965.558041] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558044] Call Trace:
Jun 26 12:29:18 ceo1homenx kernel: [87965.558056] __schedule+0x2d0/0x840
Jun 26 12:29:18 ceo1homenx kernel: [87965.558160] ?
nouveau_display_scanoutpos+0xe9/0x180 [nouveau]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558167] schedule+0x2c/0x70
Jun 26 12:29:18 ceo1homenx kernel: [87965.558172] schedule_timeout+0x258/0x=
360
Jun 26 12:29:18 ceo1homenx kernel: [87965.558213] ?
__drm_crtc_commit_free+0x12/0x20 [drm]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558309] ?
nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558316]
dma_fence_default_wait+0x20a/0x280
Jun 26 12:29:18 ceo1homenx kernel: [87965.558320] ? dma_fence_release+0xa0/=
0xa0
Jun 26 12:29:18 ceo1homenx kernel: [87965.558325]
dma_fence_wait_timeout+0xe7/0x110
Jun 26 12:29:18 ceo1homenx kernel: [87965.558344]
drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558437]
nv50_disp_atomic_commit_tail+0x78/0x870 [nouveau]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558443] ? __switch_to+0x96/0x4e0
Jun 26 12:29:18 ceo1homenx kernel: [87965.558446] ? __switch_to_asm+0x34/0x=
70
Jun 26 12:29:18 ceo1homenx kernel: [87965.558536]
nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
Jun 26 12:29:18 ceo1homenx kernel: [87965.558542] process_one_work+0x20f/0x=
410
Jun 26 12:29:18 ceo1homenx kernel: [87965.558547] worker_thread+0x34/0x400
Jun 26 12:29:18 ceo1homenx kernel: [87965.558553] kthread+0x120/0x140
Jun 26 12:29:18 ceo1homenx kernel: [87965.558557] ?
process_one_work+0x410/0x410
Jun 26 12:29:18 ceo1homenx kernel: [87965.558563] ? __kthread_parkme+0x70/0=
x70
Jun 26 12:29:18 ceo1homenx kernel: [87965.558567] ret_from_fork+0x35/0x40
Jun 26 12:30:01 ceo1homenx CRON[12207]: (root) CMD ([ -x /etc/init.d/anacro=
n ]
&amp;&amp; if [ ! -d /run/systemd/system ]; then /usr/sbin/invoke-rc.d anac=
ron start
<span class=3D"quote">&gt;/dev/null; fi)</span >
Jun 26 12:33:21 ceo1homenx systemd[1]: Started Run anacron jobs.
Jun 26 12:33:21 ceo1homenx anacron[12372]: Anacron 2.3 started on 2019-06-26
Jun 26 12:33:21 ceo1homenx anacron[12372]: Normal exit (0 jobs run)
Jun 26 12:33:21 ceo1homenx systemd[1]: anacron.service: Succeeded.
Jun 26 12:35:02 ceo1homenx CRON[12477]: (root) CMD (command -v debian-sa1 &=
gt;
/dev/null &amp;&amp; debian-sa1 1 1)
Jun 26 12:39:01 ceo1homenx systemd[1]: Starting Clean php session files...
Jun 26 12:39:01 ceo1homenx CRON[12710]: (root) CMD ( [ -x
/usr/lib/php/sessionclean ] &amp;&amp; if [ ! -d /run/systemd/system ]; then
/usr/lib/php/sessionclean; fi)
Jun 26 12:39:01 ceo1homenx systemd[1]: phpsessionclean.service: Succeeded.
Jun 26 12:39:01 ceo1homenx systemd[1]: Started Clean php session files.
Jun 26 12:45:02 ceo1homenx CRON[13049]: (root) CMD (command -v debian-sa1 &=
gt;
/dev/null &amp;&amp; debian-sa1 1 1)
Jun 26 12:55:02 ceo1homenx CRON[13571]: (root) CMD (command -v debian-sa1 &=
gt;
/dev/null &amp;&amp; debian-sa1 1 1)
Jun 26 12:56:20 ceo1homenx kernel: [89587.485877] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx kernel: [89591.781878] nouveau 0000:01:00.0: fif=
o:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Jun 26 12:56:24 ceo1homenx kernel: [89591.781897] nouveau 0000:01:00.0: fif=
o:
runlist 0: scheduled for recovery
Jun 26 12:56:24 ceo1homenx kernel: [89591.781918] nouveau 0000:01:00.0: fif=
o:
channel 5: killed
Jun 26 12:56:24 ceo1homenx kernel: [89591.781926] nouveau 0000:01:00.0: fif=
o:
engine 0: scheduled for recovery
Jun 26 12:56:24 ceo1homenx kernel: [89591.782531] nouveau 0000:01:00.0:
Xorg[3086]: channel 5 killed!
Jun 26 12:56:24 ceo1homenx kernel: [89591.784954] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx kernel: [89591.787346] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx kernel: [89591.791222] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx kernel: [89591.799169] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx kernel: [89591.799874] nouveau 0000:01:00.0: fif=
o:
PBDMA0: 04000000 [ACQUIRE] ch 2 [007fa99000 Xorg[3086]] subc 0 mthd 001c da=
ta
00001004
Jun 26 12:56:24 ceo1homenx dbus-daemon[1027]: [system] Activating via syste=
md:
service name=3D'org.freedesktop.PackageKit' unit=3D'packagekit.service' req=
uested
by ':1.270' (uid=3D1000 pid=3D3346 comm=3D&quot;/usr/bin/plasmashell &quot;=
 label=3D&quot;unconfined&quot;)
Jun 26 12:56:24 ceo1homenx systemd[1]: Starting PackageKit Daemon...
Jun 26 12:56:24 ceo1homenx PackageKit: daemon start
Jun 26 12:56:24 ceo1homenx dbus-daemon[1027]: [system] Successfully activat=
ed
service 'org.freedesktop.PackageKit'
Jun 26 12:56:24 ceo1homenx systemd[1]: Started PackageKit Daemon.
Jun 26 13:01:30 ceo1homenx PackageKit: daemon quit
Jun 26 13:01:30 ceo1homenx systemd[1]: packagekit.service: Main process exi=
ted,
code=3Dkilled, status=3D15/TERM
Jun 26 13:01:30 ceo1homenx systemd[1]: packagekit.service: Succeeded.
Jun 26 13:05:01 ceo1homenx CRON[14159]: (root) CMD (command -v debian-sa1 &=
gt;
/dev/null &amp;&amp; debian-sa1 1 1)
Jun 26 13:09:02 ceo1homenx systemd[1]: Starting Clean php session files...
Jun 26 13:09:02 ceo1homenx CRON[14381]: (root) CMD ( [ -x
/usr/lib/php/sessionclean ] &amp;&amp; if [ ! -d /run/systemd/system ]; then
/usr/lib/php/sessionclean; fi)
Jun 26 13:09:02 ceo1homenx systemd[1]: phpsessionclean.service: Succeeded.
Jun 26 13:09:02 ceo1homenx systemd[1]: Started Clean php session files.
Jun 26 13:15:02 ceo1homenx CRON[14748]: (root) CMD (command -v debian-sa1 &=
gt;
/dev/null &amp;&amp; debian-sa1 1 1)
Jun 26 13:17:01 ceo1homenx CRON[14851]: (root) CMD ( cd / &amp;&amp; run-pa=
rts --report
/etc/cron.hourly)
Jun 26 13:17:01 ceo1homenx btrbk: startup v0.27.1 - - - # btrbk command line
client, version 0.27.1
Jun 26 13:17:01 ceo1homenx btrbk: snapshot starting
/snapshots/home_snapshots/&#64;home.20190626T1317 /snapshots/&#64;home - -
Jun 26 13:17:03 ceo1homenx btrbk: snapshot success
/snapshots/home_snapshots/&#64;home.20190626T1317 /snapshots/&#64;home - -
Jun 26 13:17:03 ceo1homenx btrbk: delete_snapshot starting
/snapshots/home_snapshots/&#64;home.20190622T1217 - - -
Jun 26 13:17:03 ceo1homenx btrbk: delete_snapshot success
/snapshots/home_snapshots/&#64;home.20190622T1217 - - -
Jun 26 13:17:03 ceo1homenx btrbk: finished success - - - -

-- Hard Lock-- power cycle reboot the only possible fix.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15615759044.2C8CcFf6.9242--

--===============0924778281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0924778281==--
