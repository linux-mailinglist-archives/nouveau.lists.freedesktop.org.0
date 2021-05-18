Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B32386FDF
	for <lists+nouveau@lfdr.de>; Tue, 18 May 2021 04:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0BA6E5AB;
	Tue, 18 May 2021 02:17:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDA06E5A3
 for <nouveau@lists.freedesktop.org>; Tue, 18 May 2021 02:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621304257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SHUED2xywhieoA8Ohgqwa/BFwS5IrraVCcyW37p8oEc=;
 b=HAxnpIeBAIgJ2cFctu//SWzGseRHbxULUCXTn6S3D1aEZCJnKItOGl0sX/uCMDVNTF8XgH
 iW+tWZzT46YNUKe49wkGl5iWQwna8b11bN2BINLH39Zd7f3i5a3LKa00hOMCK+WKx3qtGO
 vTVyNS5T7oglx0nJM7vxEkEhneqonPs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-9hy_ZxqmOMS6xXeBtKHzQg-1; Mon, 17 May 2021 22:17:36 -0400
X-MC-Unique: 9hy_ZxqmOMS6xXeBtKHzQg-1
Received: by mail-qv1-f70.google.com with SMTP id
 d11-20020a0cdb0b0000b02901c0da4391d5so6241717qvk.12
 for <nouveau@lists.freedesktop.org>; Mon, 17 May 2021 19:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SHUED2xywhieoA8Ohgqwa/BFwS5IrraVCcyW37p8oEc=;
 b=lXSTZWQtisx3yyu/3e7Jiv/UmMHTC0CtEzUbTQOUMEWktOcVZ3LBQEMrys+m6M2qZW
 DKeafQ/4D3KNbHrFMTdeppQReEYtfsXLS1Vf+sFdE3ax5lGcQAIl/Lw0xc8hXE82ChDg
 2iMs1dP9HWiLz7heT+ajLKssGDXz3GZrNiCnhldg4J+QUoihuoMjKykhLJCX8QHf4VTl
 xlHlQ+DIPeM5sKfuUTbbr6cbptlEZkis0jOMUkc5tTEn4NNeMdtzgPxbwbxC2O6O1iXu
 UUIfv0FOf5XrOhsViaggjY+xyOvjsWUWIzgXLh7qgeEgVG30qPW77CagfVc+GZS+kYrF
 IxhQ==
X-Gm-Message-State: AOAM533PSJycFH5K0hpOGzrZSnuzuICap+PX0Eekxhyx9H6WWpZcfACB
 js9IJh+3d5gwFYu/0DI02H1680/Z8rjQk89+Z15H6l2MlXcQ91JjbuNoouYdwxEAaPATzGD/hNH
 dpvO8r42g9Ys3s/511zxy330k0g==
X-Received: by 2002:a37:acc:: with SMTP id 195mr3056566qkk.237.1621304254983; 
 Mon, 17 May 2021 19:17:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvfhDruyVRENBywFHKAF09zhJc/VYjDjiU6UtKjssWV4m2MY09oz2Ie4CFZZ05uo8IZIWTfA==
X-Received: by 2002:a37:acc:: with SMTP id 195mr3056543qkk.237.1621304254755; 
 Mon, 17 May 2021 19:17:34 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id q185sm11488655qkd.69.2021.05.17.19.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 19:17:34 -0700 (PDT)
Date: Mon, 17 May 2021 22:17:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YKMjvKGIHdwQN2Ml@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-2-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210407084238.20443-2-apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 18 May 2021 02:17:50 +0000
Subject: Re: [Nouveau] [PATCH v8 1/8] mm: Remove special swap entry functions
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
Cc: rcampbell@nvidia.com, willy@infradead.org, daniel@ffwll.ch,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 bsingharora@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jgg@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Apr 07, 2021 at 06:42:31PM +1000, Alistair Popple wrote:
> +static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
> +{
> +	struct page *p = pfn_to_page(swp_offset(entry));
> +
> +	/*
> +	 * Any use of migration entries may only occur while the
> +	 * corresponding page is locked
> +	 */
> +	BUG_ON(is_migration_entry(entry) && !PageLocked(p));
> +
> +	return p;
> +}

Would swap_pfn_entry_to_page() be slightly better?

The thing is it's very easy to read pfn_*() as a function to take a pfn as
parameter...

Since I'm also recently working on some swap-related new ptes [1], I'm thinking
whether we could name these swap entries as "swap XXX entries".  Say, "swap
hwpoison entry", "swap pfn entry" (which is a superset of "swap migration
entry", "swap device exclusive entry", ...).  That's where I came with the
above swap_pfn_entry_to_page(), then below will be naturally is_swap_pfn_entry().

No strong opinion as this is already a v8 series (and sorry to chim in this
late), just to raise this up.

[1] https://lore.kernel.org/lkml/20210427161317.50682-1-peterx@redhat.com/

Thanks,

> +
> +/*
> + * A pfn swap entry is a special type of swap entry that always has a pfn stored
> + * in the swap offset. They are used to represent unaddressable device memory
> + * and to restrict access to a page undergoing migration.
> + */
> +static inline bool is_pfn_swap_entry(swp_entry_t entry)
> +{
> +	return is_migration_entry(entry) || is_device_private_entry(entry);
> +}

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
