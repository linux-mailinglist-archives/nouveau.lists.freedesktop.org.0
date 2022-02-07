Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B394ACCA2
	for <lists+nouveau@lfdr.de>; Tue,  8 Feb 2022 00:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F23910E11A;
	Mon,  7 Feb 2022 23:42:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE5510E3D0
 for <nouveau@lists.freedesktop.org>; Mon,  7 Feb 2022 23:42:51 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id y5so14831403pfe.4
 for <nouveau@lists.freedesktop.org>; Mon, 07 Feb 2022 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xL7zYBxlDA9OyfIUt1+hVo3jnzbaDpzhjP+X9npLjjg=;
 b=wphYccQt9nxerxeU/p5xPEp3OdfAMZRtra+QtigCBGV2rEpNVW9+U6vtvsejhTgn8e
 AjHdHHleGcguuyudfB/EYL8nXm+kpV8ZcSykDngC+byWUyRxqjSZ/RPjTH8AXc+RnLns
 uIgVupROuzl/7/rcKGowF45+b0zBguco1bdtkEO3QuTU6AEph9xDvvOseyxx2hOke+gU
 uNJF3+A19rkf9glt328qDrxjnlD9a+5MH5956bLQ7wt6C83PtpfdJpKPQIdDraMVj14L
 rYSrK3ggYTWNdNsRn2y7f5gnAE9dOOC2PJVNruXRQWVHXWccOP1/uFHHzbWsGMDwZaME
 cPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xL7zYBxlDA9OyfIUt1+hVo3jnzbaDpzhjP+X9npLjjg=;
 b=k5agAszI7rWXBaV80TXp2FnKYNV1KFSGyUjZBqiKNl+tJ6QRtjIEt5dKgJHNaegpXp
 cbgIBAs16MAmIY24dLS1OqwfbJRcT4j9cjaNDECYfSA7+oextnMolxKH/ybB4qy6rLts
 Rl3Nb7W24oyZCb9l583siMU97vFFzQYs+urwUmIjXhDOVzipdNlJsRLbLic0gaTgDYMV
 r8YLxoIkI/01uZriN6E4pYHHSMrlxhhwWnbEXuei74p86oJqPXPtyyiLwlRAPyEvDcUl
 ZyImc/cOJnHV5jaiNEzaBKuzCWW5p36lag3nsh9vpsoHWK/rjC/qqSyXFfY8Ybui9Wo1
 aRaw==
X-Gm-Message-State: AOAM5301U69EAZuBR4LSSZiLaUcss++d3Z8jfh7cKDQHYauaZt7NgF9v
 PQ/PeXpIZ33iBHqUN/p3wXE5urOJWNmAPmoEnyvSGg==
X-Google-Smtp-Source: ABdhPJwrqWzltx/fzSQ9DuX2BTfk2qmQ+rOek9DuscJqYjd5cc23devekMbaCYKV7qKyZJb3bcu/cjHgnw2J/KhyG60=
X-Received: by 2002:a65:484b:: with SMTP id i11mr1385516pgs.40.1644277370737; 
 Mon, 07 Feb 2022 15:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-6-hch@lst.de>
In-Reply-To: <20220207063249.1833066-6-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 7 Feb 2022 15:42:39 -0800
Message-ID: <CAPcyv4iP=+jtVgdnuZjR3b-jM27zH5uk167HM=wz+=PBfvA49Q@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH 5/8] mm: simplify freeing of devmap managed
 pages
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Feb 6, 2022 at 10:33 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Make put_devmap_managed_page return if it took charge of the page
> or not and remove the separate page_is_devmap_managed helper.

Looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
