Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF148392273
	for <lists+nouveau@lfdr.de>; Thu, 27 May 2021 00:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9146EDDF;
	Wed, 26 May 2021 22:00:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FEE6E83F
 for <nouveau@lists.freedesktop.org>; Wed, 26 May 2021 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622058071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IK6Th4ZCx+0amLJEZjMrTW9bDpGzITHnRAL9h8VgscA=;
 b=ZV5MmiOxp6cFaupevgIBPi+3x03Bkd24qjoGhlH389dIjzps2WGegOLjnYuWXyi1xsCDlz
 3WfY7/xAIPZl7HBh5BkmYxdBeK+j+FtTRtwm6y5sJjSNvnaFfuOEpKWm44oaoTfgGlKQaX
 Of/yYe8irIJfXooknise8QwntP3z1aE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-0swKSE-WONuVeftWqcmxbw-1; Wed, 26 May 2021 15:41:09 -0400
X-MC-Unique: 0swKSE-WONuVeftWqcmxbw-1
Received: by mail-qv1-f71.google.com with SMTP id
 h11-20020a0ceecb0000b0290211ed54e716so2112946qvs.9
 for <nouveau@lists.freedesktop.org>; Wed, 26 May 2021 12:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IK6Th4ZCx+0amLJEZjMrTW9bDpGzITHnRAL9h8VgscA=;
 b=Lf7M4srtoqtr+HgUw5biVrD8b8q1L1n1JFQYkm17VxoGb00plnX1OVGgTyrb5Pn1yM
 dZUGNuWDtrL9FFDwQMbKhcY2cHZ4u64LLKUEY7pz2UArvd4n+ipJJko2wUU2mT3c+gdK
 tfnG0vJSSVURI4uSGvxLpMjHhjewil1Buj+Rlz6p2MVPSBIw0+NDicJFO1c1FbiPuyUN
 VkyaxEPbO/vkmpNwpb/l5YSML9++PyINE0XJReS/k3GKKDNjcxMSSz74Xge4UvR+CmdG
 2nATFqcXFplkNnRTpsHy5WA9UnwffsvMBQCg4AQO94QnXb+dcAcqrxik9onm6KpppP6m
 hIxg==
X-Gm-Message-State: AOAM530H1OpC0B7HvPZzrj/J31685kwI9RV7Wh4JIeW4M4V96cFRHbZp
 vV4+uUzkllJnqama4NJ3yKLBc6vMUGohp1Eo4a0dGAgH8IeGvBxjI2GUxGU/LsNQGmsEmcUfBjz
 Ug65XiKnOHK9+KgQ0vFL15FbLIg==
X-Received: by 2002:ac8:5bc2:: with SMTP id b2mr38732464qtb.220.1622058069380; 
 Wed, 26 May 2021 12:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJnPqtQWXkJ/e/uDJethFbtPOcM3K9BKum6Ztqo6rrKUmjkHKDiiSLmcCX23fB6dWiie8WzA==
X-Received: by 2002:ac8:5bc2:: with SMTP id b2mr38732446qtb.220.1622058069146; 
 Wed, 26 May 2021 12:41:09 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id j1sm2056219qtn.83.2021.05.26.12.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 12:41:08 -0700 (PDT)
Date: Wed, 26 May 2021 15:41:07 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YK6kU25FDhuZC3AV@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-6-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210524132725.12697-6-apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 26 May 2021 22:00:01 +0000
Subject: Re: [Nouveau] [PATCH v9 05/10] mm: Rename migrate_pgmap_owner
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, bskeggs@redhat.com, jgg@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 11:27:20PM +1000, Alistair Popple wrote:
> @@ -521,14 +521,14 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
>  	range->flags = flags;
>  }
>  
> -static inline void mmu_notifier_range_init_migrate(
> -			struct mmu_notifier_range *range, unsigned int flags,
> +static inline void mmu_notifier_range_init_owner(
> +			struct mmu_notifier_range *range,
> +			enum mmu_notifier_event event, unsigned int flags,
>  			struct vm_area_struct *vma, struct mm_struct *mm,
> -			unsigned long start, unsigned long end, void *pgmap)
> +			unsigned long start, unsigned long end, void *owner)
>  {
> -	mmu_notifier_range_init(range, MMU_NOTIFY_MIGRATE, flags, vma, mm,
> -				start, end);
> -	range->migrate_pgmap_owner = pgmap;
> +	mmu_notifier_range_init(range, event, flags, vma, mm, start, end);
> +	range->owner = owner;
>  }

mmu_notifier_range_init_migrate() can even be kept to just call the new helper,
then existing callers are unaffected.  Not a big deal, though:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
