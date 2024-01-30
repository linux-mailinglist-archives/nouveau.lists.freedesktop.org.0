Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2E6841C00
	for <lists+nouveau@lfdr.de>; Tue, 30 Jan 2024 07:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA6310F033;
	Tue, 30 Jan 2024 06:36:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1613 seconds by postgrey-1.36 at gabe;
 Tue, 30 Jan 2024 06:36:35 UTC
Received: from mxe.seznam.cz (mxe.seznam.cz [77.75.78.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AEF10ED4E
 for <nouveau@lists.freedesktop.org>; Tue, 30 Jan 2024 06:36:34 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxe-6598fcb576-wjtt6
 (smtpc-mxe-6598fcb576-wjtt6 [2a02:598:64:8a00::1000:af7])
 id 65f4f28d757c48b165fedfcc; Tue, 30 Jan 2024 07:35:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
 s=szn20221014; t=1706596531;
 bh=ti7MG/ZZC2mWPOVOiionE9nTne28yN/IC8QBIZELk1I=;
 h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
 Content-Type;
 b=g1oxKv7HZM9Xt0TO824RVq/HghHDHiqqkLS8VVeSV4FzPosereqvnK7YdjAfxxx+U
 iS8Ndj4OT9Xtt6qBZBHHplorap8qJSSCNHyCqhlVpgb9nklVkmHsV+CcICseKreqIF
 aM+8y4L44yHKfdj6cUfZzj31QpV2KABqnJXfz47YmcYWN2xEA41tpgTnHXnWF+7bVW
 2v6rdqjf/MchKhvx2TOg3bJOhDOHS11Qwd81U7z5t1/PAgoY0OS+9mhJZOos6Vdsk0
 6ihs+cqGUEICXOjVSH1oj8b1dh3vzkgWQEgYEk0MczSaBN0irtghGAmWSdwxpnbG5O
 nhqslYhHhEDog==
Received: from unknown ([109.183.32.44])
 by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
 Tue, 30 Jan 2024 07:08:38 +0100 (CET)
From: "Zdenek Sojka" <zsojka@seznam.cz>
To: <nouveau@lists.freedesktop.org>
Subject: =?utf-8?q?GT216M_=5BGeForce_GT_240M=5D_=28NV50/Tesla=29_sddm_fail?=
 =?utf-8?q?s_to_start_since_commit_0a2f6372a43ff5e948b8b10be34d4473f6c2ef6?=
 =?utf-8?q?c?=
Date: Tue, 30 Jan 2024 07:08:38 +0100 (CET)
Message-Id: <6qQ.2DW}.7fbyaXLxaf0.1bk99c@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.1.33)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: multipart/alternative;
 boundary="=_4e430e1d218c90565f2a523f=0d80602b-ca2c-588f-a56b-bf577d5abd9f_="
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--=_4e430e1d218c90565f2a523f=0d80602b-ca2c-588f-a56b-bf577d5abd9f_=
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear nouveau mailing list,

on my notebook with the GeForce GT 240M graphics card, I am failing to sta=
rt
sddm since linux kernel 6.5.0.
The screen typically goes black or white, mouse pointer is typically visib=
le
and can be moved.
This happens about 90% of times I try to start the system; in about 10%, =

everything works fine.
If the start fails, dmesg shows output such as:
[=C2=A0=C2=A0 20.260153] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 6 [sd=
dm-greeter
[3136]] get 0000216088 put 0000217a3c ib_get 00000009 ib_put 0000000a stat=
e 
80000024 (err: INVALID_CMD) push 00400040
[=C2=A0=C2=A0 20.262191] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 6 [sd=
dm-greeter
[3136]] get 0000217a3c put 0000219820 ib_get 0000000b ib_put 0000000c stat=
e 
80000024 (err: INVALID_CMD) push 00400040
[=C2=A0=C2=A0 20.265970] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 6 [sd=
dm-greeter
[3136]] get 0000219820 put 0000219e50 ib_get 0000000d ib_put 0000000e stat=
e 
80000024 (err: INVALID_CMD) push 00400040


I've bisected this to:
0a2f6372a43ff5e948b8b10be34d4473f6c2ef6c is the first bad commit
commit 0a2f6372a43ff5e948b8b10be34d4473f6c2ef6c
Author: Christoph Hellwig <hch@lst.de>
Date:=C2=A0=C2=A0 Fri Apr 7 08:31:30 2023 +0200

=C2=A0=C2=A0=C2=A0 drm/nouveau: stop using is_swiotlb_active

=C2=A0=C2=A0=C2=A0 Drivers have no business looking into dma-mapping inter=
nals and check
=C2=A0=C2=A0=C2=A0 what backend is used.=C2=A0 Unfortunstely the DRM core =
is still broken and
=C2=A0=C2=A0=C2=A0 tries to do plain page allocations instead of using DMA=
 API allocators
=C2=A0=C2=A0=C2=A0 by default and uses various bandaids on when to use dma=
_alloc_coherent.

=C2=A0=C2=A0=C2=A0 Switch nouveau to use the same (broken) scheme as amdgp=
u and radeon
=C2=A0=C2=A0=C2=A0 to remove the last driver user of is_swiotlb_active.

=C2=A0=C2=A0=C2=A0 Signed-off-by: Christoph Hellwig <hch@lst.de>
=C2=A0=C2=A0=C2=A0 Reviewed-by: Lyude Paul <lyude@redhat.com>

=C2=A0drivers/gpu/drm/nouveau/nouveau_ttm.c | 10 +++-------
=C2=A01 file changed, 3 insertions(+), 7 deletions(-)


I've tried various kernel (both vanilla or gentoo-patched), with custom or=
 
distro configuration; I didn't observe any difference since 6.5.

I didn't check what the return value of drm_need_swiotlb() is when sddm =

starts fine; but

+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -302,7 +302,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ttm_device_init(&drm->t=
tm.bdev, &nouveau_bo_driver, drm->dev->
dev,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->anon_inode->i_=
mapping,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->vma_offset_man=
ager,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_need_swiotlb(drm->cli=
ent.mmu.dmabits),
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm->client.mmu.dma=
bits <=3D 32);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 NV_ERROR(drm, "error initialising bo driver, %d\n", ret=
);

seem to prevent this problem for me

I welcome any help with this problem

Best regards,
Zdenek Sojka

--=_4e430e1d218c90565f2a523f=0d80602b-ca2c-588f-a56b-bf577d5abd9f_=
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body>Dear nouveau mailing list,<br><br>on my notebook with the GeFo=
rce GT 240M graphics card, I am failing to start sddm since linux kernel 6=
.5.0.<br>The screen typically goes black or white, mouse pointer is typica=
lly visible and can be moved.<br>This happens about 90% of times I try to =
start the system; in about 10%, everything works fine.<br>If the start fai=
ls, dmesg shows output such as:<br>[&nbsp;&nbsp; 20.260153] nouveau 0000:0=
1:00.0: fifo: DMA_PUSHER - ch 6 [sddm-greeter[3136]] get 0000216088 put 00=
00217a3c ib_get 00000009 ib_put 0000000a state 80000024 (err: INVALID_CMD)=
 push 00400040<br>[&nbsp;&nbsp; 20.262191] nouveau 0000:01:00.0: fifo: DMA=
_PUSHER - ch 6 [sddm-greeter[3136]] get 0000217a3c put 0000219820 ib_get 0=
000000b ib_put 0000000c state 80000024 (err: INVALID_CMD) push 00400040<br=
>[&nbsp;&nbsp; 20.265970] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 6 [s=
ddm-greeter[3136]] get 0000219820 put 0000219e50 ib_get 0000000d ib_put 00=
00000e state 80000024 (err: INVALID_CMD) push 00400040<br><br><br>I've bis=
ected this to:<br>0a2f6372a43ff5e948b8b10be34d4473f6c2ef6c is the first ba=
d commit<br>commit 0a2f6372a43ff5e948b8b10be34d4473f6c2ef6c<br>Author: Chr=
istoph Hellwig &lt;hch@lst.de&gt;<br>Date:&nbsp;&nbsp; Fri Apr 7 08:31:30 =
2023 +0200<br><br>&nbsp;&nbsp;&nbsp; drm/nouveau: stop using is_swiotlb_ac=
tive<br><br>&nbsp;&nbsp;&nbsp; Drivers have no business looking into dma-m=
apping internals and check<br>&nbsp;&nbsp;&nbsp; what backend is used.&nbs=
p; Unfortunstely the DRM core is still broken and<br>&nbsp;&nbsp;&nbsp; tr=
ies to do plain page allocations instead of using DMA API allocators<br>&n=
bsp;&nbsp;&nbsp; by default and uses various bandaids on when to use dma_a=
lloc_coherent.<br><br>&nbsp;&nbsp;&nbsp; Switch nouveau to use the same (b=
roken) scheme as amdgpu and radeon<br>&nbsp;&nbsp;&nbsp; to remove the las=
t driver user of is_swiotlb_active.<br><br>&nbsp;&nbsp;&nbsp; Signed-off-b=
y: Christoph Hellwig &lt;hch@lst.de&gt;<br>&nbsp;&nbsp;&nbsp; Reviewed-by:=
 Lyude Paul &lt;lyude@redhat.com&gt;<br><br>&nbsp;drivers/gpu/drm/nouveau/=
nouveau_ttm.c | 10 +++-------<br>&nbsp;1 file changed, 3 insertions(+), 7 =
deletions(-)<br><br><br>I've tried various kernel (both vanilla or gentoo-=
patched), with custom or distro configuration; I didn't observe any differ=
ence since 6.5.<br><br>I didn't check what the return value of drm_need_sw=
iotlb() is when sddm starts fine; but<br><br>+++ b/drivers/gpu/drm/nouveau=
/nouveau_ttm.c<br>@@ -302,7 +302,7 @@ nouveau_ttm_init(struct nouveau_drm =
*drm)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D ttm_device_ini=
t(&amp;drm-&gt;ttm.bdev, &amp;nouveau_bo_driver, drm-&gt;dev-&gt;dev,<br>&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;anon_inode-&gt;i=
_mapping,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;vm=
a_offset_manager,<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_nee=
d_swiotlb(drm-&gt;client.mmu.dmabits),<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 1,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm=
-&gt;client.mmu.dmabits &lt;=3D 32);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; if (ret) {<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NV_ERROR(drm, "error initialising =
bo driver, %d\n", ret);<br><br>seem to prevent this problem for me<br><br>=
I welcome any help with this problem<br><br>Best regards,<br>Zdenek Sojka<=
br></body></html>
--=_4e430e1d218c90565f2a523f=0d80602b-ca2c-588f-a56b-bf577d5abd9f_=--

