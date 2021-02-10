Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D439316D68
	for <lists+nouveau@lfdr.de>; Wed, 10 Feb 2021 18:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C806E2D7;
	Wed, 10 Feb 2021 17:56:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946B56E06E
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 17:56:29 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id n28so2129849qtv.12
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 09:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RUQ3IiEy3EeRQSWZTl5rkIVfBMl0Yr+7rUwczbTqPUI=;
 b=a+PshXZQLSQ7/K/9jegFaNYC0vZtmSYFRP1bDA8dbf8/musoPpHsw5fl3p1ROGJKfd
 BIwN8dEMPEjoYVb1yDkSYhphTXpCL9gSnrGEzHWvQCXWv29Ejjq92mz5G3Dg0KmE0XCX
 FeeRFLPtrUqSk8F0amJkbyHTGLQm8PvYyk+6v0OxaHba2MdI5fI0N/d0XsEh6GVU5emG
 /0vg6Fo5+WSy7jh21z0QKnlqdDB/yryAPmpCWW8UUSaCKsVbVpQw7LWKFor1C0y7OngB
 hQc5Rc67W3FeJVpxVwzluKmOqtnpGTOUR0RUS2WW2uLURW1Ug+7jhSO51GMEDjEjkQEH
 Fj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RUQ3IiEy3EeRQSWZTl5rkIVfBMl0Yr+7rUwczbTqPUI=;
 b=GeWWANrgVsChHDt+GlqCMpS29Ac7bFB8PPOSj1xIRhNuhvAnO9jJRbkaa2SxCUcAlS
 45p9H0sVoY3HawH3nkeAkgp82IoNfVlLpI7i4z+8FTCUF7w388tPRiD0weAHr3oX3u//
 ui+LtClwPy9h5A/siOZHH9QxO8BsABETLokW838Lij8Avf+BWewoOImQDqQBnFEJEn0K
 scEaDzVVz/zE7N2hF3T127N0W0jgHaGV381yv8qOFDgK2IaU1p9B4ilHK1tHByxzIgYa
 aZAXbkXrIFM0GBqoNC+hvLdsGBmfON8JZ4fwaRt9EA9v0Y34Aa+kCwEH5g/Mk4ZhWbC5
 0iyQ==
X-Gm-Message-State: AOAM532VrEMsBwlsM1s4oL5rS665EUqq+GYbzDgth0zhJ7f9QWaQOkEU
 GLQEC9B+dRsVuEIVie+Uw0aDtQ==
X-Google-Smtp-Source: ABdhPJwWEC9HwbcTz58sdbmUTleaPOjsDExx3u3MJe7UYTKAqinGSmHRrRGSIqyVmc4V1t6YgU/4OQ==
X-Received: by 2002:ac8:d03:: with SMTP id q3mr3814296qti.19.1612979788592;
 Wed, 10 Feb 2021 09:56:28 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id a25sm1697115qtw.87.2021.02.10.09.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 09:56:27 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l9tj0-00686U-SC; Wed, 10 Feb 2021 13:56:26 -0400
Date: Wed, 10 Feb 2021 13:56:26 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>
Message-ID: <20210210175626.GN4718@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian> <20210209133520.GB4718@ziepe.ca>
 <20210209211738.GA834106@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209211738.GA834106@redhat.com>
Subject: Re: [Nouveau] [PATCH 0/9] Add support for SVM atomics in Nouveau
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 04:17:38PM -0500, Jerome Glisse wrote:

> > > Yes, I would like to avoid the long term pin constraints as well if possible I
> > > just haven't found a solution yet. Are you suggesting it might be possible to 
> > > add a callback in the page migration logic to specially deal with moving these 
> > > pages?
> > 
> > How would migration even find the page?
> 
> Migration can scan memory from physical address (isolate_migratepages_range())
> So the CPU mapping is not the only path to get to a page.

I mean find out that the page is now owned by the GPU driver to tell
it that it needs to migrate that reference. Normally that would go
through the VMA to the mmu notifier, but with the page removed from
the normal VMA it can't get to a mmu notifier or the GPU driver.

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
