Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75AB3163AF
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 11:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08E36EC44;
	Wed, 10 Feb 2021 10:23:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876256EC44
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612952631;
 bh=Vq6dWL7Zxrr7pAP49IZthRSzIUA5WpcrslIVeeGno20=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date;
 b=Tb2PoE7C1eEceRNUgTETSVDDzp2SnfCZ+y86iyTTGl9KygJ3cTfb5Xn/3+yDSSgke
 Yg3ohqMeAe4LQQdfW+/XfvnU1dhahy6bKB50DLH+maDmmpqfuxHunLKNFCfHqWZp7x
 Hw1vMjXq/Lkw1F/yW1kS8QCN8r6GnMY3EpaWtDrs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.218.231]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYXs-1lcluh0Mko-00m0KS; Wed, 10
 Feb 2021 11:13:13 +0100
Message-ID: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: lkml <linux-kernel@vger.kernel.org>
Date: Wed, 10 Feb 2021 11:13:12 +0100
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:1HXL5IfZ2qpNdgLAcAlpZ3nzIPILydFUVIXY8HO/DUXJ5re9Cqe
 4dvppVsmevD5Q2pzyTdPfyBMQS02ydgxwA9Dhtz6Snh82Nv+maD/A7S+h6L4H6S2R32rx5P
 hdsE2uUVXbvMzoXCnE2RJusGVLGZdxHQdcSjLbEEWSAsjoW/jow0eSQ6AtQdFI/34k4UNnU
 qWKnhnimcrLZWYiS4a6kg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PIzofsy5h0c=:sABympC0c8IXvDfIikluKN
 rwZzQAP+2aY8wzX2yCIVUK3CmPO+RqrfT9rUKy6usXrWSCiIo934r5xVjlATpAm15A2l+pfN0
 O1uAw5Ofyq3BI0q22QhPGLHimyD1PGMo9PJip9TDgvcoKLd0E0yVhgPS8gE7YUxgzGM5ycbwn
 ekitX7eVNq3cRCTUZ+rzs4OkphFoQUYim5ByJbuThsfyhcTC/Zs0mWLatnk4dlM1IqLHJZUIq
 eMiolGbv31GVxkqbHrVyeiVbepiKlPZdy58IFlf2ctRCoBO8T4YyzvBTCchjQ1PolkuSGUTjD
 8ly2wrStqZ8JIMn+iRJgdkGgWScH5NXjfM12rPmrRbs2W6VdVB9bagzqt0NO4LhfjCKqLAVLp
 ddClOZxco54hjmR756jheNx7ZraWjblz0Mt1eLggkqHT+DK3zmpoWAZap5v9/BpkCFed/L8iy
 zm3PXzlt/aH9mFW96KjrrGPSHJ0XHQst0CLOrnqolpXiXyETo6N+s4YpsEqAjACEzngE4lzQL
 nQBysHsF3XLMd8+RsyVKYoM5dPVPylHk9EslXIm+pbiXYyT960ab9xPgQB9ehNcWGfjpPRxkd
 BiTHPaTBOlMeXL9tdpSQednER3lcEY1m6urGs+V909rcQef184CztXLYG91iDI68NT+/02MgB
 H6N2n12+3UKwylfPjWdvPPcvyn5qhl1oqW8/cC9nk4+MXBUDIs/Hrvf8ldCOB5BhQhv8RE8B3
 dpSH+1HImmRdztS0cFBP1DTvfJiL2RrGBFbYWAliRVK6/PCxYfVxpmDqr8ylGB8bIv4Cl18Fm
 uwdpnKr+o2hfDrx8mvTstrrQV4WVopKhfPOJRse+9WVP2evm7SFbPmjftXLEL2iH0POdhqa40
 Vcb29Hq/74KiL9CkFPYg==
Subject: [Nouveau] drm/nouneau: 5.11 cycle regression bisected to
 461619f5c324 "drm/nouveau: switch to new allocator"
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
Cc: nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Greetings,

The symptom is tasks stuck waiting for lord knows what by calling
sched_yield() in a loop (less than wonderful, sched_yield() sucks).
After boot to KDE login, I immediately see tracker-extract chewing cpu
in aforementioned loop. Firing up evolution and poking 'new' to
compose, WebKitWebProcess joins in the yield loop fun.

Hand rolled reverts of 256dd44b "drm/ttm: nuke old page allocator" and
the fingered commit cures the problem for me at 207665fd in the bisect
log below, and at master and tip HEAD.

There's a "things that make ya go hmm" aspect to this thing though.  If
you look at the bisect log below, the starting "bad" is 207665fd.  That
commit DOES NOT exhibit the yield loop symptom immediately out of the
box, but DOES after applying the much needed fix...

	660a59953f4f "drm/nouveau: fix multihop when move doesn't work"

...to prevent an earlier regression from quickly appearing, one which
Dave will likely recall having fixed.  Relevant?  No idea, but seems
worth mentioning.

Box: aging generic i4790 box with its equally aged Nvidia GTX 980.


461619f5c3242aaee9ec3f0b7072719bd86ea207 is the first bad commit
commit 461619f5c3242aaee9ec3f0b7072719bd86ea207
Author: Christian K=F6nig <christian.koenig@amd.com>
Date:   Sat Oct 24 13:13:25 2020 +0200

    drm/nouveau: switch to new allocator

    It should be able to handle all cases now.

    Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
    Reviewed-by: Dave Airlie <airlied@redhat.com>
    Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
    Tested-by: Huang Rui <ray.huang@amd.com>
    Link: https://patchwork.freedesktop.org/patch/397082/?series=3D83051&re=
v=3D1

 drivers/gpu/drm/nouveau/nouveau_bo.c  | 30 ++----------------------------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  1 -
 2 files changed, 2 insertions(+), 29 deletions(-)

git bisect start
# good: [2c85ebc57b3e1817b6ce1a6b703928e113a90442] Linux 5.10
git bisect good 3f995f8e0b540342612d3f6b1fc299f5bf486987
# bad: [207665fd37561f97591e74d0ee80f24bdf06b789] Merge tag 'exynos-drm-nex=
t-for-v5.11' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-e=
xynos into drm-next
git bisect bad 207665fd37561f97591e74d0ee80f24bdf06b789
# good: [f8394f232b1eab649ce2df5c5f15b0e528c92091] Linux 5.10-rc3
git bisect good f8394f232b1eab649ce2df5c5f15b0e528c92091
# good: [b3bf99daaee96a141536ce5c60a0d6dba6ec1d23] drm/i915/display: Defer =
initial modeset until after GGTT is initialised
git bisect good b3bf99daaee96a141536ce5c60a0d6dba6ec1d23
# good: [dfbbfe3c17651fa0fcf2658fb90317df08e52bb2] drm/amd/display: Add for=
mats for DCC with 2/3 planes.
git bisect good dfbbfe3c17651fa0fcf2658fb90317df08e52bb2
# bad: [112e505a76de69f8667e2fe8da38433f754364a8] Merge drm/drm-next into d=
rm-misc-next
git bisect bad 112e505a76de69f8667e2fe8da38433f754364a8
# bad: [49a3f51dfeeecb52c5aa28c5cb9592fe5e39bf95] drm/gem: Use struct dma_b=
uf_map in GEM vmap ops and convert GEM backends
git bisect bad 49a3f51dfeeecb52c5aa28c5cb9592fe5e39bf95
# bad: [d7e0798925ea9272f8c8e66ceb1f7c51823e50ab] dt-bindings: display: bri=
dge: Intel KeemBay DSI
git bisect bad d7e0798925ea9272f8c8e66ceb1f7c51823e50ab
# bad: [c489573b5b6ce6442ad4658d9d5ec77839b91622] Merge drm/drm-next into d=
rm-misc-next
git bisect bad c489573b5b6ce6442ad4658d9d5ec77839b91622
# bad: [8567d51555c12d169c4e0f796030051fff1c318d] drm/vmwgfx: switch to new=
 allocator
git bisect bad 8567d51555c12d169c4e0f796030051fff1c318d
# good: [5144eead3f8c80ac7f913c07139442fede94003e] drm: xlnx: Use dma_reque=
st_chan for DMA channel request
git bisect good 5144eead3f8c80ac7f913c07139442fede94003e
# good: [e93b2da9799e5cb97760969f3e1f02a5bdac29fe] drm/amdgpu: switch to ne=
w allocator v2
git bisect good e93b2da9799e5cb97760969f3e1f02a5bdac29fe
# bad: [461619f5c3242aaee9ec3f0b7072719bd86ea207] drm/nouveau: switch to ne=
w allocator
git bisect bad 461619f5c3242aaee9ec3f0b7072719bd86ea207
# good: [0fe3cf3a53b5c1205ec7d321be1185b075dff205] drm/radeon: switch to ne=
w allocator v2
git bisect good 0fe3cf3a53b5c1205ec7d321be1185b075dff205
# first bad commit: [461619f5c3242aaee9ec3f0b7072719bd86ea207] drm/nouveau:=
 switch to new allocator

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
