Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421C32DD22A
	for <lists+nouveau@lfdr.de>; Thu, 17 Dec 2020 14:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19926E3D8;
	Thu, 17 Dec 2020 13:30:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573DD6E3D8
 for <nouveau@lists.freedesktop.org>; Thu, 17 Dec 2020 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1608211829;
 bh=vttV0XuGr2T6d6XRDMi0jzHgkwS0AX57Zmlog3LL0eI=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=gA+ZYTvVgEaxDrR+5vByBG1eSkHJSh0QKDPhoZoc9+X09S7v/WD3IWsZoO/gq2RLM
 1kDB9DEZ30ugfoKNvHAfFgs+hswjMK9gz5A58BaSi33ii+PM7jzF7r+0WfNtdwIxoa
 hdOWodso5+/ZucgkEIjXK4R1yNAwIAiOMNrOojXY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.217.61]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1ki9ZJ2lmO-00Rajw; Thu, 17
 Dec 2020 14:30:29 +0100
Message-ID: <136aa09d13fab723e0460b73608ed3950699f2b6.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: lkml <linux-kernel@vger.kernel.org>
Date: Thu, 17 Dec 2020 14:30:29 +0100
In-Reply-To: <fe612bbbeedd0ee0d03d04c7341ea62406b957c7.camel@gmx.de>
References: <fe612bbbeedd0ee0d03d04c7341ea62406b957c7.camel@gmx.de>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:AQ0GIZzMgM8Hz/xuf+hyDDBLjBEIs8+DBbSQn1euQf9y8apY2vv
 ogUdHMGUXICVNsZRL3ZAojKzChytR1Lo4CcO+/IjsBlrrN122ve0fHw6yhZR4UWEI2whUpJ
 dM0Vi5MWJ3IODBI3C3IKCTwe9hlPHzwtHPq3AYlL69bUIkJw3hVElBF5O1fBr04wxhlxU3v
 DWRAUk4u5XWAJPQ2a5FQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sO0azyDOeWE=:mhn0KwaFyk5LU2wKrye03q
 qx5q/lK7gvLboAQX8bRlojMQR+oFNQ2tGVJkJ7pinXNaM6vTcJ2nnEyirGsosQjs2vrkPRfIk
 uBCJGpnm3KcPwBCBIOvu/5dIiojhwstxtD61p5TFfl2CIVb+rUcyIxbuo88hksswME23VCxtI
 QLVPMKMXRvycITTKA5j9l+Ll0ZdqaQ8NXm6+cn74BMe4mxJiQ6qvqRxitSgyv7v6sVXAU1rrS
 gJ645hSqYM7A6fBTjtZz4TOvLCv3HmGMu2pDEQV8fy3AhVVpoHlpd4eQniwqCllyEANiEzvmz
 pl+W3VAolp9p30Gk+utEOP4zXrua17+x4EPXq5X2w1Q1x1+Dduyso/nuxP922SET5cSgEA/tV
 /Ic/JgfoL0xvsLqMxfHtQcVrPMYzVlAOIvQfxgazjGA970JqVGOuyJ6Qmweydvp32uCaQkutS
 bBV9HHvwmRqaXdUCjo65CzPqzgztzBEuC2/f4/p3Zt7buSzneAuEsaAhUbZmqsDlhO86PDHVi
 rxvzc4dsogRoATQXjIJSbh3thE01JANRodJtgHDxAMa10yY3iJchLmV3pkejdhsb8/HP+u3uC
 etVh89RaZBg8XkjfyN4UFHvKNamVj6YIfg2f5zziikwLgF0x5wSdL4uPxRl5kJ5TRcm+DQcf+
 Pib1k02nmD184syGou8KSX0PJIM14bj8OYaZ/NTo3baFoZkXkTeCBjcnDh3WOjn0DN4TLO0ry
 pSAREYsaib5PDwezMMzL4fBMT2vlFpt/szKev82yo3MmJ5Bs2wb0aPEJk/kn1QQrdLlfe8vRl
 p0l9EYx402zY36JA9Rf5/PUTUvspnyitS8w+1CZqSR2vR+gkQhbKI3cHYSV+PGgFWSsBx51jP
 TqKCXBo/MpYu/yNHEVGg==
Subject: [Nouveau] [bisected] Re: regression: nouveau fifo: fault 01 ==>
 channel 1: killed ==> dead desktop
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 2020-12-16 at 14:31 +0100, Mike Galbraith wrote:
> When the below new to 5.11 cycle badness happens, it's time to reboot.
>
> ...
> [   27.467260] NFSD: Using UMH upcall client tracking operations.
> [   27.467273] NFSD: starting 90-second grace period (net f00000a0)
> [   27.965138] Bridge firewalling registered
> [   39.096604] fuse: init (API version 7.32)
> [  961.579832] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at 0000000000=
69f000 engine 15 [CE0] client 01 [HUB/CE0] reason 02 [PTE] on channel 1 [00=
ff73d000 DRM]
> [  961.579840] nouveau 0000:01:00.0: fifo: channel 1: killed
> [  961.579844] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recov=
ery
> [  961.579850] nouveau 0000:01:00.0: fifo: runlist 4: scheduled for recov=
ery
> [  961.579853] nouveau 0000:01:00.0: fifo: engine 4: scheduled for recove=
ry
>
> Box is aging generic i4790 desktop box with...
> 01:00.0 VGA compatible controller: NVIDIA Corporation GM204 [GeForce GTX =
980] (rev a1)

Bisection was straight forward.  A post bisect test revert was equally
straight forward, and seems to confirm the fingered commit.

0c8c0659d7475b6304b67374caf15b56cf0be4f9 is the first bad commit
commit 0c8c0659d7475b6304b67374caf15b56cf0be4f9
Author: Dave Airlie <airlied@redhat.com>
Date:   Thu Oct 29 13:59:20 2020 +1000

    drm/nouveau/ttm: use multihop

    This removes the code to move resources directly between
    SYSTEM and VRAM in favour of using the core ttm mulithop code.

    Signed-off-by: Dave Airlie <airlied@redhat.com>
    Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20201109005432.8619=
36-4-airlied@gmail.com

 drivers/gpu/drm/nouveau/nouveau_bo.c | 112 ++++---------------------------=
----
 1 file changed, 13 insertions(+), 99 deletions(-)

git bisect start 'drivers/gpu'
# good: [2c85ebc57b3e1817b6ce1a6b703928e113a90442] Linux 5.10
git bisect good 2c85ebc57b3e1817b6ce1a6b703928e113a90442
# bad: [accefff5b547a9a1d959c7e76ad539bf2480e78b] Merge tag 'arm-soc-omap-g=
enpd-5.11' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad accefff5b547a9a1d959c7e76ad539bf2480e78b
# bad: [d635a69dd4981cc51f90293f5f64268620ed1565] Merge tag 'net-next-5.11'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect bad d635a69dd4981cc51f90293f5f64268620ed1565
# bad: [0ca2ce81eb8ee30f3ba8ac7967fef9cfbb44dbdb] Merge tag 'arm64-upstream=
' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
git bisect bad 0ca2ce81eb8ee30f3ba8ac7967fef9cfbb44dbdb
# good: [f8aab60422c371425365d386dfd51e0c6c5b1041] drm/amdgpu: Initialise d=
rm_gem_object_funcs for imported BOs
git bisect good f8aab60422c371425365d386dfd51e0c6c5b1041
# bad: [fab0fca1da5cdc48be051715cd9787df04fdce3a] Merge tag 'media/v5.11-1'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect bad fab0fca1da5cdc48be051715cd9787df04fdce3a
# bad: [bcc68bd8161261ceeb1a4ab02b5265758944f90d] Merge tag 'auxdisplay-for=
-linus-v5.11' of git://github.com/ojeda/linux
git bisect bad bcc68bd8161261ceeb1a4ab02b5265758944f90d
# bad: [22f8c80566c4a29a0d8b5ebf24aa1fd1679b39e5] Merge tag 'drm-misc-next-=
2020-11-18' of ssh://git.freedesktop.org/git/drm/drm-misc into drm-next
git bisect bad 22f8c80566c4a29a0d8b5ebf24aa1fd1679b39e5
# bad: [a1ac250a82a5e97db71f14101ff7468291a6aaef] fbcon: Avoid using FNTCHA=
RCNT() and hard-coded built-in font charcount
git bisect bad a1ac250a82a5e97db71f14101ff7468291a6aaef
# good: [a39855076c859b7f6c58ed4da8f195a2a6cd3c7b] drm/cma-helper: Make def=
ault object functions the default
git bisect good a39855076c859b7f6c58ed4da8f195a2a6cd3c7b
# bad: [5f1f10998e7f0ba98a8efc27009cd9a11cff6616] drm/atmel-hlcdc/atmel_hlc=
dc_plane: Staticise local function 'atmel_hlcdc_plane_setup_scaler()'
git bisect bad 5f1f10998e7f0ba98a8efc27009cd9a11cff6616
# good: [55c8bcaeccaa5c6d9e7a432ebd0a1717f488a3f4] drm: mxsfb: Implement .f=
ormat_mod_supported
git bisect good 55c8bcaeccaa5c6d9e7a432ebd0a1717f488a3f4
# bad: [0c8c0659d7475b6304b67374caf15b56cf0be4f9] drm/nouveau/ttm: use mult=
ihop
git bisect bad 0c8c0659d7475b6304b67374caf15b56cf0be4f9
# good: [23d6ab1d4c503660632e7b18cbb571d62d9bf792] drm: remove pgprot_decry=
pted() before calls to io_remap_pfn_range()
git bisect good 23d6ab1d4c503660632e7b18cbb571d62d9bf792
# good: [ebdf565169af006ee3be8c40eecbfc77d28a3b84] drm/ttm: add multihop in=
frastrucutre (v3)
git bisect good ebdf565169af006ee3be8c40eecbfc77d28a3b84
# good: [f5a89a5cae812a39993be32e74c8ed7856b1e2b2] drm/amdgpu/ttm: use mult=
ihop
git bisect good f5a89a5cae812a39993be32e74c8ed7856b1e2b2
# first bad commit: [0c8c0659d7475b6304b67374caf15b56cf0be4f9] drm/nouveau/=
ttm: use multihop

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
