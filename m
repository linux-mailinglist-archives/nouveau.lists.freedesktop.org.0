Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 825CD41CD4D
	for <lists+nouveau@lfdr.de>; Wed, 29 Sep 2021 22:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BE26E20F;
	Wed, 29 Sep 2021 20:17:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3560B6E20F
 for <nouveau@lists.freedesktop.org>; Wed, 29 Sep 2021 20:17:04 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id f2so3623098vsj.4
 for <nouveau@lists.freedesktop.org>; Wed, 29 Sep 2021 13:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.unc.edu; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=r9lKLckoBFKPmXbYEdNaTsIlUxaL+QbAxvt08BB4Qp0=;
 b=V27yCkfvpAnW1iwIVXtRHOfW+NMcx/GnE9rMVls9596Z7RDpvKk4k9fwlvCAG1EdWI
 LbduMrN+hULdweC4/FsTgxTdVCdvf8JJSyXB+xKYKJtunWOmM8LqCP12sUWntVR9LOxS
 0W8Ylx5q/jmi+gLOsyRDQKn21lT3KKbrgxzus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=r9lKLckoBFKPmXbYEdNaTsIlUxaL+QbAxvt08BB4Qp0=;
 b=4HkHczFqxvFZ/GwRjxSBoCY1nWe+T6Be9CsWNkgaqfwVRlY3Ask8lOVDV0wioRqcy7
 8DBCUnBtm5q1Y5Rj/sQF/SOVgMg3/H3Y8hO5ipzs8pq0+4d7DTX3aHwKwgMbpt7C8Hhz
 NZemaZbFXPI2p7b2iAaqj36GFUEV4GDttZJpYpCfDMz9wGCkFJ1icrYq/Cku0arGvWHN
 fGm4/X88OmVs9ngCJgNxLn0Z2Qd+R+5OZVAVqedr79uZmaNtK1pzds7YaorOf+UEpSOy
 Glhbz+aF6ZIfyT9qEV9mt5delTe/dADaw9TrTUqBw1cW2XLPo04GIa08p62N85F9F2b6
 OGzw==
X-Gm-Message-State: AOAM530Zm3eViAs56quACYWao74jT2ZtdFL0d8eGFlos5047MGwnXZtU
 rHQIIwuKyYJLhzdbPwbbXi1O4bYVPGFvxMmFSIwBQkWZG614TXZO
X-Google-Smtp-Source: ABdhPJzAhNwcKk/QlhCuKU2qfUivYuwOHnvPTe/LrpEYSwWbtYMoskN0AWzQvR+gbRD789DXcNIBLqTXbSQ1b7k5YvA=
X-Received: by 2002:a05:6102:3548:: with SMTP id
 e8mr771555vss.44.1632946622718; 
 Wed, 29 Sep 2021 13:17:02 -0700 (PDT)
MIME-Version: 1.0
From: Joshua Bakita <jbakita@cs.unc.edu>
Date: Wed, 29 Sep 2021 16:16:52 -0400
Message-ID: <CAAy0SxCY_5jpsRnR+okQ1HgXE2frzPe98hNJ8Yrju-bMRDqLnQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: [Nouveau] Understanding BAR1 Offset to imem/VRAM PA Mapping
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

Hello,

I'm trying to understand how VRAM PAs are mapped to BAR1 offsets on
Fermi+, but I'm having difficulty digging through the abstractions in
nouveau. I spent the better part of yesterday digging through the
nv50_instobj_*() functions, but I lost track of which page tables are
being modified and where they're coming from somewhere around level 7
of indirection/aliasing from the nvkm_kmap() call (aka
nv50_instobj_acquire()) to the actual nvkm_vmm_iter() logic which I
think does the mapping.

If page tables are used to map BAR1 offsets to VRAM PAs on Fermi+, I'd
like to understand their relation to the normal GPU VA to PA page
tables, and how we tell the hardware which page tables to use for the
BAR1 mappings.

Best regards,

Joshua Bakita
PhD Student
UNC Chapel Hill | Real-Time Systems Group

(Apologies if anyone already received this email, I tried sending it
earlier and I think it got stuck in moderation.)
