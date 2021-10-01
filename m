Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE4741E64A
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 05:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7106F6E4FF;
	Fri,  1 Oct 2021 03:46:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3056E4FF
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 03:46:07 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id r75so10138970iod.7
 for <nouveau@lists.freedesktop.org>; Thu, 30 Sep 2021 20:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j0f50DNue4alXdmSzjDJJiV/KikmmIPcAFbk9LOcuvc=;
 b=ZRbt9MjKO5HlpvO/x0YKkiFyZ+8KGnGqGjruvijayZm0NAjRd1j4wHS95C2WnbyoHa
 RSJ4zsBD2QG7xNscTMadDFYjAzCzIwY2PXjisZvYJyCP/HhsOrBD//6xyJ9Exg4YiRuk
 yQDb45hRzsmRPYP/NBO0Dhk11PxTllY3mStYoFJLKcAflIcTFGxUP0rWPMEMdTCsAnGP
 11rIxuF3wU3cvndOcug3lyYriAb2wpcczw7HGCbs4J+AtvPmE3tKFKQz24Kk9jJJiH3d
 HO17u1H8OD6AtijroTKZDPhvrfBhuAnCoTp0dL8QS7lbIZilAdiGX/YaEtlf+GLLjtpn
 VE0g==
X-Gm-Message-State: AOAM530BKu4JbLk3Y7BOg6aMzgtymhF3Q41jXTAesJxrT54/YvYuR20E
 TMCGRjwOe1jhARxLVdhIzcp0UNI1UvJBZQTWfz4=
X-Google-Smtp-Source: ABdhPJyBxQaiygWEq1JRv8qng/cv0R/n/cV4ouxWEsK+/Qh1t3rUyG34w6sHeUFdJnvAUvfz1PbgnG5OWNyW7JaDGSg=
X-Received: by 2002:a05:6638:134f:: with SMTP id
 u15mr8027238jad.82.1633059966723; 
 Thu, 30 Sep 2021 20:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAAy0SxCY_5jpsRnR+okQ1HgXE2frzPe98hNJ8Yrju-bMRDqLnQ@mail.gmail.com>
In-Reply-To: <CAAy0SxCY_5jpsRnR+okQ1HgXE2frzPe98hNJ8Yrju-bMRDqLnQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 30 Sep 2021 23:45:55 -0400
Message-ID: <CAKb7UvhUQrbD8tpn=K3KBg4BycFh5zvKM+G0He4onu3dXnYdYw@mail.gmail.com>
To: Joshua Bakita <jbakita@cs.unc.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Understanding BAR1 Offset to imem/VRAM PA Mapping
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

Hi Joshua,

It looks like you got most of the way there. The BARs (BAR1 and BAR3)
are initialized by the code in nvkm/subdev/bar/gf100.c. As you can
see, this sets up a vmm per BAR, whose (physical address >> 12) is
written to 0x1704 / 0x1714. A vmm is basically a list of PDE's (and
the PTE lists those PDE's point to). The address, I believe, is the
base of the PDE's (or maybe they start at 0x200 from the base
address). I believe that all addresses relative to the appropriate BAR
are then translated through this vmm and hit the appropriate physical
VRAM addresses. You can see how this is all set up in
nvkm/subdev/mmu/vmmgf100.c. The code is somewhat fancy to generically
deal with different page sizes/etc, but you can mostly ignore that.
Different generations allow different things, which is what you'll
find in the subsequent vmm* files. Pascal gains 48-bit virtual
addresses (up from 40), which I think changes some details around as
well.

Ben - please correct me if I'm wrong. I suspect I missed some details
relative to *actually* making this work, but this should be the gist
of it.

Hope this helps,

  -ilia

On Wed, Sep 29, 2021 at 4:17 PM Joshua Bakita <jbakita@cs.unc.edu> wrote:
>
> Hello,
>
> I'm trying to understand how VRAM PAs are mapped to BAR1 offsets on
> Fermi+, but I'm having difficulty digging through the abstractions in
> nouveau. I spent the better part of yesterday digging through the
> nv50_instobj_*() functions, but I lost track of which page tables are
> being modified and where they're coming from somewhere around level 7
> of indirection/aliasing from the nvkm_kmap() call (aka
> nv50_instobj_acquire()) to the actual nvkm_vmm_iter() logic which I
> think does the mapping.
>
> If page tables are used to map BAR1 offsets to VRAM PAs on Fermi+, I'd
> like to understand their relation to the normal GPU VA to PA page
> tables, and how we tell the hardware which page tables to use for the
> BAR1 mappings.
>
> Best regards,
>
> Joshua Bakita
> PhD Student
> UNC Chapel Hill | Real-Time Systems Group
>
> (Apologies if anyone already received this email, I tried sending it
> earlier and I think it got stuck in moderation.)
