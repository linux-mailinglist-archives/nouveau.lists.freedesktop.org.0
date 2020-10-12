Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6251F28C3DE
	for <lists+nouveau@lfdr.de>; Mon, 12 Oct 2020 23:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5DF89BC2;
	Mon, 12 Oct 2020 21:14:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5798813A
 for <nouveau@lists.freedesktop.org>; Mon, 12 Oct 2020 21:14:20 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id dt13so25216784ejb.12
 for <nouveau@lists.freedesktop.org>; Mon, 12 Oct 2020 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+E/x/oIv2ijFm2c9w4wv62KEKilXSc7t2Sb9ekDFptw=;
 b=Edzs632po8qKWgO3YwL1+/WtB+jp3E2Vu3gnBGR3UWRBL5wqJFRo1ZiouYvd1j7hdU
 Ixp12qDDQ78vGjE3OV/Lj7aXRatwmUPIiEL72PLClFVepJZovvzodPZGKEyxKZ9N3xzC
 /wGWB0EZXZiyIIdnohsdUSrkF2j3ljeNYyfJpgOxpuRecdCzWN9MlXi1HxwYn3AG3Y+j
 Ez7G84Q3qjBphLh3URy4AEUUlcVBgQlK2HwfEj6iwS7/1bTQlNl3JMbkVP+uoaeiZmrz
 LYmcl5Q9ho6uVvcilbmyEJCZ07yD0pc3UEOxk5BWy9nUQ1CumAEd4X0Eyuz1wzQmRqHk
 qAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+E/x/oIv2ijFm2c9w4wv62KEKilXSc7t2Sb9ekDFptw=;
 b=tifOPNQKO9MfViJMGhV126zQWPrETZfbodgnVRVRorWMHtfj3jj4WWYoqt7TiV0ta6
 9J/1NuEWT2OYfNJbiu7XMaSPPLkpb9xRbJ4yF+s/4HGqYZ+2zzpG6mJFCVBqCh95VqJJ
 2XSZ1er+fpGKqxfPenAaXPTMuKgpu4hN3hrS7kstsSG5JwXYZjjKnMPubwUAMnLEIIbb
 1rU6nuL3YZGfldKPr6KfWhXl1pK2mAx2ojEABJpvdI8e/Jmylqux6v3khUoWW0cW8rfx
 j2zRs1IqZ7Gycc2aeLNztW06inW/LJYV4D4tSFcTkhN6n+uWuJADBXPYu/sW6eWQMFK7
 3mqA==
X-Gm-Message-State: AOAM531TQIRmEStZ1QdbjxaxQpZogZr9zh+nUoAvDYwyOA06Hl/IY9Zi
 BUf62e+JvsNoEplS1W6s8KTWxJNawBh++rYooRvy9Q==
X-Google-Smtp-Source: ABdhPJz02OtB37X1Kl6Yw4VB2J5fzc4t6W8lA+4qFWxSxgpuA/gexEv+m5h1tqboEVvNq9alpAfTRLuAH8zdbpyQqLs=
X-Received: by 2002:a17:906:b88f:: with SMTP id
 hb15mr29759160ejb.45.1602537258704; 
 Mon, 12 Oct 2020 14:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201012174540.17328-1-rcampbell@nvidia.com>
In-Reply-To: <20201012174540.17328-1-rcampbell@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 12 Oct 2020 14:14:07 -0700
Message-ID: <CAPcyv4ijD+=3rje1CfSG4XKuRNfuAWOui93NQV09NmBte_gc0w@mail.gmail.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [Nouveau] [PATCH v2] mm/hmm: make device private reference
 counts zero based
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
 Linux MM <linux-mm@kvack.org>, kvm-ppc@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 10:46 AM Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> ZONE_DEVICE struct pages have an extra reference count that complicates the
> code for put_page() and several places in the kernel that need to check the
> reference count to see that a page is not being used (gup, compaction,
> migration, etc.). Clean up the code so the reference count doesn't need to
> be treated specially for device private pages, leaving DAX as still being
> a special case.

Please no half-step to removing the special casing...

[..]
> +void free_zone_device_page(struct page *page)
> +{
> +       if (!is_device_private_page(page))
>                 return;

That seems too subtle to be acceptable to me. All ZONE_DEVICE pages
need to have the same relationship with respect to idle-ness and the
page reference count.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
