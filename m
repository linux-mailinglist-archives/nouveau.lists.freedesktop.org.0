Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9563679930C
	for <lists+nouveau@lfdr.de>; Sat,  9 Sep 2023 02:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1234410E245;
	Sat,  9 Sep 2023 00:14:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C003E10E3B3
 for <nouveau@lists.freedesktop.org>; Tue,  5 Sep 2023 16:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693931970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FYmV1SAUAP6clEqFptERvvV4+Mtfaips/SG+vcFGBs=;
 b=i+dGR3jD5z9Tog76fxTjg51O4NcW6m6KItmgEUbQ6y0GDe65VdLf7hhL0EC4F5vdglkN4S
 KO4okYydQ7KvvPP1nyqpiQeAZGgARNLHRcMUpLdPHSAXfDYziS0zbFYrZDyF7q8nltjRoF
 kKCDAFEezzVtmi8VvUQlNle9/XORfNs=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-7KpSnHTIM3mN9nYGbdBu2g-1; Tue, 05 Sep 2023 12:39:29 -0400
X-MC-Unique: 7KpSnHTIM3mN9nYGbdBu2g-1
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-786ca3e9160so729739f.1
 for <nouveau@lists.freedesktop.org>; Tue, 05 Sep 2023 09:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693931968; x=1694536768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1FYmV1SAUAP6clEqFptERvvV4+Mtfaips/SG+vcFGBs=;
 b=QIGgxCCRnYKoYXBdt/D3F0/uXWoaO2RskXECgBGb0a9OamRVpsQUTTs9wiAC3VWMmc
 0fM7EocO76MnbeC0bKl6om0vpBeND2gwignwXygcAFllQd9Vl3S3KDuLCzgt7sZhx15n
 r8sYdfqagOADnniWLRzMPGXwlaNPhAOK2a4Bci/efOfmZGPKcxZtqR0z1Iuj9XjuMoKw
 n9kmOFRN4I+v8NLMlykzT6ikPUwTqXdsaK7coqArbRegoo5ghnSw42N/MYhq384BBHuA
 VmSCVCo5O4n+H5g4aRcy30wBig+0KJU64bV9+nJ7mJ9FEwuEVUdFQ1l9wMtKWcHFkq5j
 /kmQ==
X-Gm-Message-State: AOJu0Yz7ixhlcZjZ4rbS6eNIb0sGKkaMbiSpacqHRIWDK5EVUllv4+z2
 5fSxsBEutcGwa03ePdXQD28RMETBGEke86VoCmYLSXmIq72aM4s2UOI1VyzThpdLzx6jCTvxVAf
 vHB4Y0JFCJs+9hTcabBbE6NU/pQ==
X-Received: by 2002:a05:6602:3707:b0:790:83e7:5000 with SMTP id
 bh7-20020a056602370700b0079083e75000mr15181199iob.2.1693931968720; 
 Tue, 05 Sep 2023 09:39:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrWgqWuvOjsPoQobmizp2yeXMxuOnvBLg+UYg0lVO0d7NoPYToo5iwU98Xj9J9TSkNPuS/Gw==
X-Received: by 2002:a05:6602:3707:b0:790:83e7:5000 with SMTP id
 bh7-20020a056602370700b0079083e75000mr15181190iob.2.1693931968466; 
 Tue, 05 Sep 2023 09:39:28 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 l14-20020a02ccee000000b0042b929d3d2fsm4177089jaq.86.2023.09.05.09.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 09:39:27 -0700 (PDT)
Date: Tue, 5 Sep 2023 10:39:26 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: suijingfeng <suijingfeng@loongson.cn>
Message-ID: <20230905103926.2eda2c36.alex.williamson@redhat.com>
In-Reply-To: <ce81413d-4872-8804-d816-0f1ef88b82cb@loongson.cn>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <20230905085243.4b22725e.alex.williamson@redhat.com>
 <ce81413d-4872-8804-d816-0f1ef88b82cb@loongson.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 6 Sep 2023 00:21:09 +0800
suijingfeng <suijingfeng@loongson.cn> wrote:

> Hi,
> 
> On 2023/9/5 22:52, Alex Williamson wrote:
> > On Tue,  5 Sep 2023 03:57:15 +0800
> > Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> >  
> >> From: Sui Jingfeng <suijingfeng@loongson.cn>
> >>
> >> On a machine with multiple GPUs, a Linux user has no control over which
> >> one is primary at boot time. This series tries to solve above mentioned
> >> problem by introduced the ->be_primary() function stub. The specific
> >> device drivers can provide an implementation to hook up with this stub by
> >> calling the vga_client_register() function.
> >>
> >> Once the driver bound the device successfully, VGAARB will call back to
> >> the device driver. To query if the device drivers want to be primary or
> >> not. Device drivers can just pass NULL if have no such needs.
> >>
> >> Please note that:
> >>
> >> 1) The ARM64, Loongarch, Mips servers have a lot PCIe slot, and I would
> >>     like to mount at least three video cards.
> >>
> >> 2) Typically, those non-86 machines don't have a good UEFI firmware
> >>     support, which doesn't support select primary GPU as firmware stage.
> >>     Even on x86, there are old UEFI firmwares which already made undesired
> >>     decision for you.
> >>
> >> 3) This series is attempt to solve the remain problems at the driver level,
> >>     while another series[1] of me is target to solve the majority of the
> >>     problems at device level.
> >>
> >> Tested (limited) on x86 with four video card mounted, Intel UHD Graphics
> >> 630 is the default boot VGA, successfully override by ast2400 with
> >> ast.modeset=10 append at the kernel cmd line.
> >>
> >> $ lspci | grep VGA
> >>
> >>   00:02.0 VGA compatible controller: Intel Corporation CoffeeLake-S GT2 [UHD Graphics 630]  
> > In all my previous experiments with VGA routing and IGD I found that
> > IGD can't actually release VGA routing and Intel confirmed the hardware
> > doesn't have the ability to do so.  It will always be primary from a
> > VGA routing perspective.  Was this actually tested with non-UEFI?  
> 
> Yes, I have tested on my aspire e471 notebook (i5 5200U),
> because that notebook using legacy firmware (also have UEFI, double firmware).
> But this machine have difficult in install ubuntu under UEFI firmware in the past.
> So I keep it using the legacy firmware.
> 
> It have two video card, IGD and nvidia video card(GFORCE 840M).
> nvidia call its video card as 3D controller (pci->class = 0x030200)
> 
> I have tested this patch and another patch mention at [1] together.
> I can tell you that the firmware framebuffer of this notebook using vesafb, not efifb.
> And the framebuffer size (lfb.size) is very small. This is very strange,
> but I don't have enough time to look in details. But still works.
> 
> I'm using and tesing my patch whenever and wherever possible.

So you're testing VGA routing using a non-VGA 3D controller through the
VESA address space?  How does that test anything about VGA routing?

> > I suspect it might only work in UEFI mode where we probably don't
> > actually have a dependency on VGA routing.  This is essentially why
> > vfio requires UEFI ROMs when assigning GPUs to VMs, VGA routing is too
> > broken to use on Intel systems with IGD.  Thanks,  
> 
> 
> What you tell me here is the side effect come with the VGA-compatible,
> but I'm focus on the arbitration itself. I think there no need to keep
> the VGA routing hardware features nowadays except that hardware vendor
> want keep the backward compatibility and/or comply the PCI VGA compatible spec.

"VGA arbitration" is the mediation of VGA routing between devices, so
I'm confused how you can be focused on the arbitration without the
routing itself.  Thanks,

Alex

