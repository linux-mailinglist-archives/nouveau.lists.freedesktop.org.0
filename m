Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1672DD97E
	for <lists+nouveau@lfdr.de>; Thu, 17 Dec 2020 20:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14DB89930;
	Thu, 17 Dec 2020 19:45:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA43589930
 for <nouveau@lists.freedesktop.org>; Thu, 17 Dec 2020 19:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608234341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nb7PGJmbWoZK6Xb8BUPoFwHqAOTqo6YECVOzq5JXhKw=;
 b=OZ8MX8FkJkSQTRAyYdR0VmHYbeVwH6pOvGq6PR7jZUXkDB1P0P5La5xiTR+zJQsq4TgQlK
 nFdR5KKz0/tyD33GuUr0/PKPy+Iuy5nlWYioEbL8Ksve12EREYfTDxmFhZVrnlIyw2qyyd
 0eVtTf7PvU17hZnOACv7RDiyn4BmpGw=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-SOZfMr8kMxG18V4y_7gd2g-1; Thu, 17 Dec 2020 14:45:36 -0500
X-MC-Unique: SOZfMr8kMxG18V4y_7gd2g-1
Received: by mail-ot1-f69.google.com with SMTP id l37so10806498ota.1
 for <nouveau@lists.freedesktop.org>; Thu, 17 Dec 2020 11:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nb7PGJmbWoZK6Xb8BUPoFwHqAOTqo6YECVOzq5JXhKw=;
 b=k4kd6Dg5Q2PszUIX6Wrb9Yt7Ag7NvZ3sv0sZ8H0MW13FppXO8qTM17xbqYUxr6utK7
 g0LXRSeB0tEAx6W347g4WnY0YPRaoqaDuUcDyIrtC03zCfGy18YV9yg5e6/TNKwBwCVV
 BBP1t9ocNG8K+y6H+ut/ogMdEniBd/Ajkxf7t286/LhPXZKgJjN04Gcwm2bmeyrcnG1S
 d9yiljEUf5SJcaqpzEmIUJn2efqdBfv/udrjGVzzDTPQgk0foWujs68etmUDTBEuqS0g
 z5KkhJmXJbsqgQ0SiC39zV5pGgYiB985kORk4WBBShyX36aC7Bv01mpWr3TBBnUMakUV
 P3Zw==
X-Gm-Message-State: AOAM532ET1lgAXstQ9GP3I+ptefq1scuOUvrrheK/RYJ+DdHk9qI3t2M
 K6+Zy6621qIdDmarO+oaQFuYZ2KZbIsaYHJa4nPtjSh4hXWHyQfX3Owh+BbIRlBfUwGnM3po2uO
 xDo+mRZ4bDQ3K8r0tUT+qgr+PxCdvPh1DztY6k2eM1Q==
X-Received: by 2002:a05:6830:1e7a:: with SMTP id
 m26mr430207otr.78.1608234335174; 
 Thu, 17 Dec 2020 11:45:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2YI+h68BoCVXr+rm+2y69SlTL2FYCdSbdD7vZiTQ9kM/YLLB5HULRWDfjGeXF4EHNix6ZkJub+YE6igQEA+c=
X-Received: by 2002:a05:6830:1e7a:: with SMTP id
 m26mr430192otr.78.1608234334946; 
 Thu, 17 Dec 2020 11:45:34 -0800 (PST)
MIME-Version: 1.0
References: <fe612bbbeedd0ee0d03d04c7341ea62406b957c7.camel@gmx.de>
 <136aa09d13fab723e0460b73608ed3950699f2b6.camel@gmx.de>
In-Reply-To: <136aa09d13fab723e0460b73608ed3950699f2b6.camel@gmx.de>
From: David Airlie <airlied@redhat.com>
Date: Fri, 18 Dec 2020 05:45:22 +1000
Message-ID: <CAMwc25rTv0=LuAUoHqC9+Eh6rdaywwrigMza6yKbwbRiEwLZGg@mail.gmail.com>
To: Mike Galbraith <efault@gmx.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="0000000000004046b105b6ae3c0b"
Subject: Re: [Nouveau] [bisected] Re: regression: nouveau fifo: fault 01 ==>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--0000000000004046b105b6ae3c0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mike,

Thanks for the report,

Does the attached patch help?

Dave.

On Thu, Dec 17, 2020 at 11:30 PM Mike Galbraith <efault@gmx.de> wrote:
>
> On Wed, 2020-12-16 at 14:31 +0100, Mike Galbraith wrote:
> > When the below new to 5.11 cycle badness happens, it's time to reboot.
> >
> > ...
> > [   27.467260] NFSD: Using UMH upcall client tracking operations.
> > [   27.467273] NFSD: starting 90-second grace period (net f00000a0)
> > [   27.965138] Bridge firewalling registered
> > [   39.096604] fuse: init (API version 7.32)
> > [  961.579832] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at 00000000=
0069f000 engine 15 [CE0] client 01 [HUB/CE0] reason 02 [PTE] on channel 1 [=
00ff73d000 DRM]
> > [  961.579840] nouveau 0000:01:00.0: fifo: channel 1: killed
> > [  961.579844] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for rec=
overy
> > [  961.579850] nouveau 0000:01:00.0: fifo: runlist 4: scheduled for rec=
overy
> > [  961.579853] nouveau 0000:01:00.0: fifo: engine 4: scheduled for reco=
very
> >
> > Box is aging generic i4790 desktop box with...
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GM204 [GeForce GT=
X 980] (rev a1)
>
> Bisection was straight forward.  A post bisect test revert was equally
> straight forward, and seems to confirm the fingered commit.
>
> 0c8c0659d7475b6304b67374caf15b56cf0be4f9 is the first bad commit
> commit 0c8c0659d7475b6304b67374caf15b56cf0be4f9
> Author: Dave Airlie <airlied@redhat.com>
> Date:   Thu Oct 29 13:59:20 2020 +1000
>
>     drm/nouveau/ttm: use multihop
>
>     This removes the code to move resources directly between
>     SYSTEM and VRAM in favour of using the core ttm mulithop code.
>
>     Signed-off-by: Dave Airlie <airlied@redhat.com>
>     Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>     Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20201109005432.86=
1936-4-airlied@gmail.com
>
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 112 ++++-------------------------=
------
>  1 file changed, 13 insertions(+), 99 deletions(-)
>
> git bisect start 'drivers/gpu'
> # good: [2c85ebc57b3e1817b6ce1a6b703928e113a90442] Linux 5.10
> git bisect good 2c85ebc57b3e1817b6ce1a6b703928e113a90442
> # bad: [accefff5b547a9a1d959c7e76ad539bf2480e78b] Merge tag 'arm-soc-omap=
-genpd-5.11' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect bad accefff5b547a9a1d959c7e76ad539bf2480e78b
> # bad: [d635a69dd4981cc51f90293f5f64268620ed1565] Merge tag 'net-next-5.1=
1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> git bisect bad d635a69dd4981cc51f90293f5f64268620ed1565
> # bad: [0ca2ce81eb8ee30f3ba8ac7967fef9cfbb44dbdb] Merge tag 'arm64-upstre=
am' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
> git bisect bad 0ca2ce81eb8ee30f3ba8ac7967fef9cfbb44dbdb
> # good: [f8aab60422c371425365d386dfd51e0c6c5b1041] drm/amdgpu: Initialise=
 drm_gem_object_funcs for imported BOs
> git bisect good f8aab60422c371425365d386dfd51e0c6c5b1041
> # bad: [fab0fca1da5cdc48be051715cd9787df04fdce3a] Merge tag 'media/v5.11-=
1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
> git bisect bad fab0fca1da5cdc48be051715cd9787df04fdce3a
> # bad: [bcc68bd8161261ceeb1a4ab02b5265758944f90d] Merge tag 'auxdisplay-f=
or-linus-v5.11' of git://github.com/ojeda/linux
> git bisect bad bcc68bd8161261ceeb1a4ab02b5265758944f90d
> # bad: [22f8c80566c4a29a0d8b5ebf24aa1fd1679b39e5] Merge tag 'drm-misc-nex=
t-2020-11-18' of ssh://git.freedesktop.org/git/drm/drm-misc into drm-next
> git bisect bad 22f8c80566c4a29a0d8b5ebf24aa1fd1679b39e5
> # bad: [a1ac250a82a5e97db71f14101ff7468291a6aaef] fbcon: Avoid using FNTC=
HARCNT() and hard-coded built-in font charcount
> git bisect bad a1ac250a82a5e97db71f14101ff7468291a6aaef
> # good: [a39855076c859b7f6c58ed4da8f195a2a6cd3c7b] drm/cma-helper: Make d=
efault object functions the default
> git bisect good a39855076c859b7f6c58ed4da8f195a2a6cd3c7b
> # bad: [5f1f10998e7f0ba98a8efc27009cd9a11cff6616] drm/atmel-hlcdc/atmel_h=
lcdc_plane: Staticise local function 'atmel_hlcdc_plane_setup_scaler()'
> git bisect bad 5f1f10998e7f0ba98a8efc27009cd9a11cff6616
> # good: [55c8bcaeccaa5c6d9e7a432ebd0a1717f488a3f4] drm: mxsfb: Implement =
.format_mod_supported
> git bisect good 55c8bcaeccaa5c6d9e7a432ebd0a1717f488a3f4
> # bad: [0c8c0659d7475b6304b67374caf15b56cf0be4f9] drm/nouveau/ttm: use mu=
ltihop
> git bisect bad 0c8c0659d7475b6304b67374caf15b56cf0be4f9
> # good: [23d6ab1d4c503660632e7b18cbb571d62d9bf792] drm: remove pgprot_dec=
rypted() before calls to io_remap_pfn_range()
> git bisect good 23d6ab1d4c503660632e7b18cbb571d62d9bf792
> # good: [ebdf565169af006ee3be8c40eecbfc77d28a3b84] drm/ttm: add multihop =
infrastrucutre (v3)
> git bisect good ebdf565169af006ee3be8c40eecbfc77d28a3b84
> # good: [f5a89a5cae812a39993be32e74c8ed7856b1e2b2] drm/amdgpu/ttm: use mu=
ltihop
> git bisect good f5a89a5cae812a39993be32e74c8ed7856b1e2b2
> # first bad commit: [0c8c0659d7475b6304b67374caf15b56cf0be4f9] drm/nouvea=
u/ttm: use multihop
>

--0000000000004046b105b6ae3c0b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-nouveau-fix-multihop-when-move-doesn-t-work.patch"
Content-Disposition: attachment; 
	filename="0001-drm-nouveau-fix-multihop-when-move-doesn-t-work.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kit96sa90>
X-Attachment-Id: f_kit96sa90

RnJvbSA3ZTNlZWY5M2NkZjgyMjhkNGY5YjhlZjJmZGRkMTcwZWVkYzZhMGIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpEYXRl
OiBGcmksIDE4IERlYyAyMDIwIDA1OjQzOjE1ICsxMDAwClN1YmplY3Q6IFtQQVRDSF0gZHJtL25v
dXZlYXU6IGZpeCBtdWx0aWhvcCB3aGVuIG1vdmUgZG9lc24ndCB3b3JrLgoKQXMgcGVyIHRoZSBy
YWRlb24vYW1kZ3B1IGZpeCBkb24ndCB1c2UgbXVsdGlob3AgaXMgaHcgbW92ZXMKYXJlbid0IGVu
YWJsZWQuCgpSZXBvcnRlZC1ieTogTWlrZSBHYWxicmFpdGggPGVmYXVsdEBnbXguZGU+CkZpeGVz
OiAwYzhjMDY1OWQ3NCAoImRybS9ub3V2ZWF1L3R0bTogdXNlIG11bHRpaG9wIikKU2lnbmVkLW9m
Zi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgfCAzMSArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCmluZGV4IDEzODZiMGZjMTY0MC4uYzg1YjFhZjA2
YjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCkBAIC05NDIsMTYgKzk0Miw2
IEBAIG5vdXZlYXVfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2
aWN0LAogCXN0cnVjdCBub3V2ZWF1X2RybV90aWxlICpuZXdfdGlsZSA9IE5VTEw7CiAJaW50IHJl
dCA9IDA7CiAKLQlpZiAoKG9sZF9yZWctPm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0gJiYKLQkg
ICAgIG5ld19yZWctPm1lbV90eXBlID09IFRUTV9QTF9WUkFNKSB8fAotCSAgICAob2xkX3JlZy0+
bWVtX3R5cGUgPT0gVFRNX1BMX1ZSQU0gJiYKLQkgICAgIG5ld19yZWctPm1lbV90eXBlID09IFRU
TV9QTF9TWVNURU0pKSB7Ci0JCWhvcC0+ZnBmbiA9IDA7Ci0JCWhvcC0+bHBmbiA9IDA7Ci0JCWhv
cC0+bWVtX3R5cGUgPSBUVE1fUExfVFQ7Ci0JCWhvcC0+ZmxhZ3MgPSAwOwotCQlyZXR1cm4gLUVN
VUxUSUhPUDsKLQl9CiAKIAlpZiAobmV3X3JlZy0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUKSB7CiAJ
CXJldCA9IG5vdXZlYXVfdHRtX3R0X2JpbmQoYm8tPmJkZXYsIGJvLT50dG0sIG5ld19yZWcpOwpA
QCAtOTk1LDE0ICs5ODUsMjUgQEAgbm91dmVhdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8sIGJvb2wgZXZpY3QsCiAKIAkvKiBIYXJkd2FyZSBhc3Npc3RlZCBjb3B5LiAqLwog
CWlmIChkcm0tPnR0bS5tb3ZlKSB7CisJCWlmICgob2xkX3JlZy0+bWVtX3R5cGUgPT0gVFRNX1BM
X1NZU1RFTSAmJgorCQkgICAgIG5ld19yZWctPm1lbV90eXBlID09IFRUTV9QTF9WUkFNKSB8fAor
CQkgICAgKG9sZF9yZWctPm1lbV90eXBlID09IFRUTV9QTF9WUkFNICYmCisJCSAgICAgbmV3X3Jl
Zy0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSkpIHsKKwkJCWhvcC0+ZnBmbiA9IDA7CisJCQlo
b3AtPmxwZm4gPSAwOworCQkJaG9wLT5tZW1fdHlwZSA9IFRUTV9QTF9UVDsKKwkJCWhvcC0+Zmxh
Z3MgPSAwOworCQkJcmV0dXJuIC1FTVVMVElIT1A7CisJCX0KIAkJcmV0ID0gbm91dmVhdV9ib19t
b3ZlX20ybWYoYm8sIGV2aWN0LCBjdHgsCiAJCQkJCSAgIG5ld19yZWcpOwotCQlpZiAoIXJldCkK
LQkJCWdvdG8gb3V0OwotCX0KKwl9IGVsc2UKKwkJcmV0ID0gLUVOT0RFVjsKIAotCS8qIEZhbGxi
YWNrIHRvIHNvZnR3YXJlIGNvcHkuICovCi0JcmV0ID0gdHRtX2JvX21vdmVfbWVtY3B5KGJvLCBj
dHgsIG5ld19yZWcpOworCWlmIChyZXQpIHsKKwkJLyogRmFsbGJhY2sgdG8gc29mdHdhcmUgY29w
eS4gKi8KKwkJcmV0ID0gdHRtX2JvX21vdmVfbWVtY3B5KGJvLCBjdHgsIG5ld19yZWcpOworCX0K
IAogb3V0OgogCWlmIChkcm0tPmNsaWVudC5kZXZpY2UuaW5mby5mYW1pbHkgPCBOVl9ERVZJQ0Vf
SU5GT19WMF9URVNMQSkgewotLSAKMi4yNy4wCgo=
--0000000000004046b105b6ae3c0b
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--0000000000004046b105b6ae3c0b--

