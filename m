Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED29725B54E
	for <lists+nouveau@lfdr.de>; Wed,  2 Sep 2020 22:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2461D6E4E6;
	Wed,  2 Sep 2020 20:30:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3F26E4E6
 for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2020 20:30:10 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id z23so483789ejr.13
 for <nouveau@lists.freedesktop.org>; Wed, 02 Sep 2020 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3zH/GO18AuMjI+jK60xohkdSw2ATSnXJ1BTZdunQxr8=;
 b=IAoO8HB+G4Gyxmg6TnoHZXWP6md6wpAtsLFdpd3vUebwvRvqcoVRuBCDnz/KwTghTi
 FMiWdDJHnmdrDXvNpHBztg0GN7b8bTiFnsayrcfnI5gVZh6gHQL9mBRnYmP7nP+EZ9lZ
 TX97o8nHu5w0HGswgD+AbbJl4hU4O1TNzhIPFumoWsQFXQX8UWHdmpLFtVm1F5lO93sd
 4wxacqz8aXRzM2jY6iIRrO9fDA8ROkic5StX2H+QWptrC3xT6ASA8y/hnreHlV01VAQQ
 LvKvikYQuQseVGP2U3g1JwLzFdOhSLOMqVSUxAzm8qa3Olc6wd79QZJlwZFNTXIQ/dSx
 oz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3zH/GO18AuMjI+jK60xohkdSw2ATSnXJ1BTZdunQxr8=;
 b=mIGT8KN/ZIWWf94oAxARyJyRCs9tRTg/MDLi8W8PdpOMTF2WGBlT519eNCbVU6Yvpr
 95iYHQ4SAHTj1Y8uExfUDYfcoAF3z4aaCNbChOAyTr+1vqLiY2sYSpzCCQ/Ka7i6KoXW
 pZaVFcl4lpMq+GUgBalAGsMnJTlGnYXaMv5t7/g+Mkw6aLj2rWa0sMT1ud/V8sTdz4BR
 CQBrwSHQVIjfiPHqcIsldz7TdXbO9br1Oqz72ZVIJPNf/nYlXKqCGaJl+GwoAZ7FaWH7
 zpZh3nVunBMRoK1C666QTtoR7xQXuqShCsxFjrfpA+o8IhViHsJpuLQ9Q/gi1p9Algp8
 fMsA==
X-Gm-Message-State: AOAM532QTj9pUYVgyF+eYH9lTqEqoHr/maJpLOEDBy5VxYPkFMs2amoo
 yOlEgBqDhGavclmKZYYQx//rwho7s1a+BmLgQDQ=
X-Google-Smtp-Source: ABdhPJyzZFQeDPZketWOBEluKgnVpcrzxpuAdbHhXq4uZ8DSciz92IF8wEci8O8j7o4XyYup4i+USOLVMflTEi0tKuM=
X-Received: by 2002:a17:906:3a85:: with SMTP id
 y5mr1758578ejd.507.1599078608948; 
 Wed, 02 Sep 2020 13:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200902165830.5367-1-rcampbell@nvidia.com>
 <20200902165830.5367-2-rcampbell@nvidia.com>
In-Reply-To: <20200902165830.5367-2-rcampbell@nvidia.com>
From: Yang Shi <shy828301@gmail.com>
Date: Wed, 2 Sep 2020 13:29:56 -0700
Message-ID: <CAHbLzkqAHfVq4upkJBvWQ9XtXFfFx5=qUO4+i5XjFeNwS9XVHg@mail.gmail.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [Nouveau] [PATCH v2 1/7] mm/thp: fix __split_huge_pmd_locked()
 for migration PMD
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Linux MM <linux-mm@kvack.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Sep 2, 2020 at 9:58 AM Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> A migrating transparent huge page has to already be unmapped. Otherwise,
> the page could be modified while it is being copied to a new page and
> data could be lost. The function __split_huge_pmd() checks for a PMD
> migration entry before calling __split_huge_pmd_locked() leading one to
> think that __split_huge_pmd_locked() can handle splitting a migrating PMD.
> However, the code always increments the page->_mapcount and adjusts the
> memory control group accounting assuming the page is mapped.
> Also, if the PMD entry is a migration PMD entry, the call to
> is_huge_zero_pmd(*pmd) is incorrect because it calls pmd_pfn(pmd) instead
> of migration_entry_to_pfn(pmd_to_swp_entry(pmd)).
> Fix these problems by checking for a PMD migration entry.

Thanks for catching this. The fix looks good to me. Reviewed-by: Yang
Shi <shy828301@gmail.com>

I think this fix can go separately with the series.
>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>  mm/huge_memory.c | 42 +++++++++++++++++++++++-------------------
>  1 file changed, 23 insertions(+), 19 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2a468a4acb0a..606d712d9505 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2023,7 +2023,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>                 put_page(page);
>                 add_mm_counter(mm, mm_counter_file(page), -HPAGE_PMD_NR);
>                 return;
> -       } else if (is_huge_zero_pmd(*pmd)) {
> +       } else if (pmd_trans_huge(*pmd) && is_huge_zero_pmd(*pmd)) {
>                 /*
>                  * FIXME: Do we want to invalidate secondary mmu by calling
>                  * mmu_notifier_invalidate_range() see comments below inside
> @@ -2117,30 +2117,34 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>                 pte = pte_offset_map(&_pmd, addr);
>                 BUG_ON(!pte_none(*pte));
>                 set_pte_at(mm, addr, pte, entry);
> -               atomic_inc(&page[i]._mapcount);
> -               pte_unmap(pte);
> -       }
> -
> -       /*
> -        * Set PG_double_map before dropping compound_mapcount to avoid
> -        * false-negative page_mapped().
> -        */
> -       if (compound_mapcount(page) > 1 && !TestSetPageDoubleMap(page)) {
> -               for (i = 0; i < HPAGE_PMD_NR; i++)
> +               if (!pmd_migration)
>                         atomic_inc(&page[i]._mapcount);
> +               pte_unmap(pte);
>         }
>
> -       lock_page_memcg(page);
> -       if (atomic_add_negative(-1, compound_mapcount_ptr(page))) {
> -               /* Last compound_mapcount is gone. */
> -               __dec_lruvec_page_state(page, NR_ANON_THPS);
> -               if (TestClearPageDoubleMap(page)) {
> -                       /* No need in mapcount reference anymore */
> +       if (!pmd_migration) {
> +               /*
> +                * Set PG_double_map before dropping compound_mapcount to avoid
> +                * false-negative page_mapped().
> +                */
> +               if (compound_mapcount(page) > 1 &&
> +                   !TestSetPageDoubleMap(page)) {
>                         for (i = 0; i < HPAGE_PMD_NR; i++)
> -                               atomic_dec(&page[i]._mapcount);
> +                               atomic_inc(&page[i]._mapcount);
> +               }
> +
> +               lock_page_memcg(page);
> +               if (atomic_add_negative(-1, compound_mapcount_ptr(page))) {
> +                       /* Last compound_mapcount is gone. */
> +                       __dec_lruvec_page_state(page, NR_ANON_THPS);
> +                       if (TestClearPageDoubleMap(page)) {
> +                               /* No need in mapcount reference anymore */
> +                               for (i = 0; i < HPAGE_PMD_NR; i++)
> +                                       atomic_dec(&page[i]._mapcount);
> +                       }
>                 }
> +               unlock_page_memcg(page);
>         }
> -       unlock_page_memcg(page);
>
>         smp_wmb(); /* make pte visible before pmd */
>         pmd_populate(mm, pmd, pgtable);
> --
> 2.20.1
>
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
