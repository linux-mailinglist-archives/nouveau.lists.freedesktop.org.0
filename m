Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A665799307
	for <lists+nouveau@lfdr.de>; Sat,  9 Sep 2023 02:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9807B10E21A;
	Sat,  9 Sep 2023 00:14:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED6910E1E0
 for <nouveau@lists.freedesktop.org>; Wed,  6 Sep 2023 19:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694028550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwwduPqGCVJn22tqbOPsTtJSzzPqAt4KVB85T+OdR9M=;
 b=N7WNtkXQDquXfaQ4FGVCFu5ahGgxelHGSNQD5HB/LFgg5vggIidaOpiHfVCzl7murlPUmX
 f/lZV6xbdDTXD3zj4gx/WUwRSjO5pw/dl8/YXoOVtL0fa5CP1L+bxv+nyu2dVlfXrh2PnA
 UahjfqdoW1rmi7iOPXCmALd8UjKC8lc=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-mzhwNoP-O_WZp0y9hwEdxw-1; Wed, 06 Sep 2023 15:29:07 -0400
X-MC-Unique: mzhwNoP-O_WZp0y9hwEdxw-1
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-34f1d8e4ec6so1399705ab.1
 for <nouveau@lists.freedesktop.org>; Wed, 06 Sep 2023 12:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694028546; x=1694633346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BkNqqrFNSye+85FOkqcxyjqr5JGuixiZESeFlYs5s54=;
 b=KRuNwaGoYd6zuZnKHS++a86VJmxbPG9+QUBVyFZgQwmLZN+gSZm7Vj1aGvvpubvnd4
 fUIpJSqAHCzd07vNx1Wy8eKwVTuifmFg2vjCH2El7IrsIstFBcSAS8akv6X4INxQY4Sy
 XybHtDjzPJoBktG6HlCtJXFBB4C9Ct7jojnoH6bDQFk6tEPOPoeGX6dRQEHG72GIV6wB
 Fa25oAoC9RyssNAYfSeJeCHyeiGHVbHDkx26X185mn3AVhahAnm6yherv1qea7WOP5BP
 3nx7NU2xyJl961WsnHncRcoj7l21FNu6CAkeJwh8oWkr1ET0I3ZdN5SjqTmJuUrIwgim
 M4eg==
X-Gm-Message-State: AOJu0YwOaBGGt1CKNsaVuFr2h2gG3/UU9oqfMQcBA9OmrewcrZCgGxOn
 WGWT/8EX1cFyv/yv92DbHByZHZZ9NjQkUdxMGDftIcvwcnvNg2rLasJ7ZsTPt5ib4lwreUj/+qd
 W+X+GS/jkNJKtOFpKF2roW3Yu9A==
X-Received: by 2002:a05:6e02:1d11:b0:347:6b30:5bd3 with SMTP id
 i17-20020a056e021d1100b003476b305bd3mr21867136ila.13.1694028546540; 
 Wed, 06 Sep 2023 12:29:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyKFIvkN7zuLMbU6PvggO334g+2dgeQZvJcZ8JKJqA6E6EEEA4iTKmp69E/q99AN/ZBKFIOQ==
X-Received: by 2002:a05:6e02:1d11:b0:347:6b30:5bd3 with SMTP id
 i17-20020a056e021d1100b003476b305bd3mr21867112ila.13.1694028546213; 
 Wed, 06 Sep 2023 12:29:06 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 m11-20020a92710b000000b0034e28100d1csm3233596ilc.58.2023.09.06.12.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:29:05 -0700 (PDT)
Date: Wed, 6 Sep 2023 13:29:04 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Message-ID: <20230906132904.4e49e269.alex.williamson@redhat.com>
In-Reply-To: <a6337007-b6fa-2ce9-d0cd-46465b540205@linux.dev>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <20230905085243.4b22725e.alex.williamson@redhat.com>
 <a6337007-b6fa-2ce9-d0cd-46465b540205@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 09 Sep 2023 00:14:33 +0000
Subject: Re: [Nouveau] [RFC,
 drm-misc-next v4 0/9] PCI/VGA: Allowing the user to select the
 primary video adapter at boot time
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 6 Sep 2023 11:51:59 +0800
Sui Jingfeng <sui.jingfeng@linux.dev> wrote:

> Hi,
>=20
>=20
> On 2023/9/5 22:52, Alex Williamson wrote:
> > On Tue,  5 Sep 2023 03:57:15 +0800
> > Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> > =20
> >> From: Sui Jingfeng <suijingfeng@loongson.cn>
> >>
> >> On a machine with multiple GPUs, a Linux user has no control over whic=
h
> >> one is primary at boot time. This series tries to solve above mentione=
d
> >> problem by introduced the ->be_primary() function stub. The specific
> >> device drivers can provide an implementation to hook up with this stub=
 by
> >> calling the vga_client_register() function.
> >>
> >> Once the driver bound the device successfully, VGAARB will call back t=
o
> >> the device driver. To query if the device drivers want to be primary o=
r
> >> not. Device drivers can just pass NULL if have no such needs.
> >>
> >> Please note that:
> >>
> >> 1) The ARM64, Loongarch, Mips servers have a lot PCIe slot, and I woul=
d
> >>     like to mount at least three video cards.
> >>
> >> 2) Typically, those non-86 machines don't have a good UEFI firmware
> >>     support, which doesn't support select primary GPU as firmware stag=
e.
> >>     Even on x86, there are old UEFI firmwares which already made undes=
ired
> >>     decision for you.
> >>
> >> 3) This series is attempt to solve the remain problems at the driver l=
evel,
> >>     while another series[1] of me is target to solve the majority of t=
he
> >>     problems at device level.
> >>
> >> Tested (limited) on x86 with four video card mounted, Intel UHD Graphi=
cs
> >> 630 is the default boot VGA, successfully override by ast2400 with
> >> ast.modeset=3D10 append at the kernel cmd line.
> >>
> >> $ lspci | grep VGA
> >>
> >>   00:02.0 VGA compatible controller: Intel Corporation CoffeeLake-S GT=
2 [UHD Graphics 630] =20
> > In all my previous experiments with VGA routing and IGD I found that
> > IGD can't actually release VGA routing and Intel confirmed the hardware
> > doesn't have the ability to do so. =20
>=20
> Which model of the IGD you are using?=C2=A0even for the IGD in Atom D2550=
,
> the legacy 128KB VGA memory range can be=C2=A0tuned to be mapped to IGD
> or to the DMI Interface. See the 1.7.3.2 section of the N2000 datasheet[1=
].

I believe it's the VGA I/O that can't be disabled, there's no means to
do so other than the I/O enable bit in the command register and iirc
the driver depends on this for other features.  The history of this is
pretty old, but here are some links:

https://lore.kernel.org/all/1376486637.31494.19.camel@ul30vt.home/
https://bbs.archlinux.org/viewtopic.php?pid=3D1400212#p1400212
https://lore.kernel.org/all/20130815223917.27890.28003.stgit@bling.home/
https://lore.kernel.org/all/20130824144701.23370.42110.stgit@bling.home/
https://lore.kernel.org/all/20140509201655.2849.97478.stgit@bling.home/

I think the issue was that i915 doesn't claim to the VGA arbiter to be
controlling legacy VGA ranges, but in fact the hardware does claim
those ranges.  We can "fix" i915 to report that VGA MMIO space is
owned and can be controlled, but then Xorg likely sees multiple VGA
arbiter clients and disables DRI because it wants to mmap VGA MMIO
space.

Therefore unless something has changed in the past 10yrs, i915 owns but
does not advertise ownership of the VGA address spaces and therefore
the arbiter can't and doesn't know to change VGA routing to enable a
"be_primary" path to another device.
=20
> If a specific model of Intel has a bug in the VGA routing hardware logic =
unit,
> I would like to ignore it. Or switch to the UEFI firmware on such hardwar=
e.

That's a convenient and impractical approach.  I expect all Intel HD
graphics has this issue.  Unknown for Xe.

> It is the hardware engineer's responsibility, I will not worry about it.

We often need to deal with broken hardware in the kernel.

> Thanks for you tell this.
>=20
> [1] https://www.intel.com/content/dam/doc/datasheet/atom-d2000-n2000-vol-=
2-datasheet.pdf
>=20
>=20
> >   It will always be primary from a
> > VGA routing perspective.  Was this actually tested with non-UEFI? =20
>=20
>=20
> As you already said,=C2=A0the generous Intel already have confirmed that =
the hardware defect.
> So probably this is a good chance to switch to UEFI to solve the problem.=
 Then, no
> testing for legacy is needed.

Then why are we hacking on VGA arbitration in this series at all?

> > I suspect it might only work in UEFI mode where we probably don't
> > actually have a dependency on VGA routing.  This is essentially why
> > vfio requires UEFI ROMs when assigning GPUs to VMs, VGA routing is too
> > broken to use on Intel systems with IGD.  Thanks, =20
>=20
> Thanks for you tell me this.
>=20
> To be honest, I have only tested my patch on machines with UEFI=C2=A0firm=
ware.
> Since UEFI because the main stream, but if this patch is really useful fo=
r
> majority machine, I'm satisfied. The results is not too bad.

This looks like a pretty significant scoping issue if you're proposing
changes to the VGA arbiter which specifically handles the routing of
legacy VGA address spaces but are not willing to commit to testing
legacy configurations.  Thanks,

Alex

