Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA973893C1
	for <lists+nouveau@lfdr.de>; Wed, 19 May 2021 18:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A441C6EE1E;
	Wed, 19 May 2021 16:29:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969226ECA9
 for <nouveau@lists.freedesktop.org>; Tue, 18 May 2021 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621372603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6yuOc2aL9R33jaIl7mlMHhqH6hbm5A0t+kn6e6OKsWE=;
 b=S7oIJY1pBUY+y3xOY9sHqrU9CfblvFEvJZJ3pV8M0MfBEz4sV2n52FW0dsscQbRePEPone
 f/FXagl3vNCkFUasOmL3/j4Tg2cil5PFtD537sMB+9DKgfl46Sl1g7QTwY5gFnUr6rPC2c
 q9QEtwR6Y8kz+cFxqUOsynomcOSJi6k=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-JldQ032nP9i0CPDVA2_Dzg-1; Tue, 18 May 2021 17:16:42 -0400
X-MC-Unique: JldQ032nP9i0CPDVA2_Dzg-1
Received: by mail-qt1-f197.google.com with SMTP id
 1-20020aed31010000b029019d1c685840so8365109qtg.3
 for <nouveau@lists.freedesktop.org>; Tue, 18 May 2021 14:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6yuOc2aL9R33jaIl7mlMHhqH6hbm5A0t+kn6e6OKsWE=;
 b=UjwdeVPCb20CrdAdK7lFgPRGDNpDPgWGJvJUXWs4WMTjqo2GF8pcXtcRVvAcSF4nme
 3l8Nm0WAmDiZdhRPE2j5gsK+J4xcZCfYIyA9hKX0aDIQQrPM2TA76UU0Lyvv1Csi1009
 gNHWOpA1ZveD8HZkg625JWZeTD1s1H/Y+JMSeXBYSaAs8byBrikdAgef6NzbDrKkfRqx
 bt6DSZnaEii2zuo6M6G5A/QoKwAua+WYdpVopAFuoblZVdvNgsrexpqsZDMgxkI6dUny
 aN7/UOmy4ANltv2DVqfIHNetoG+1zcr2ln1llrRaXSDQv6VLxV2+uiEQRjbQvpggjgyV
 R1RA==
X-Gm-Message-State: AOAM530Cb4tgooAWTnKFp7tjVJpGCjNKrt8I5+eGapjERT3VSy0XSFeR
 FJAH66yUzVEPdQ6vuKmGJaNSEf5x+yvWQ2fD3sXc8njENYiB1sPvLIQpyVHwSNyX5quRfsY4mbu
 hdrRDyOznnQw2ix6flNQ7BU5x5A==
X-Received: by 2002:ac8:5b81:: with SMTP id a1mr7111157qta.172.1621372601481; 
 Tue, 18 May 2021 14:16:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7CflObEdpN93nC2c9rCnQMv5qBohaNF3R0O5eiJLrnt/E6MHpUTkD6EfDzN6tiXMS/VwRag==
X-Received: by 2002:ac8:5b81:: with SMTP id a1mr7111124qta.172.1621372601142; 
 Tue, 18 May 2021 14:16:41 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id v66sm13507150qkd.113.2021.05.18.14.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:16:40 -0700 (PDT)
Date: Tue, 18 May 2021 17:16:38 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YKQutvAa3NlgGaMm@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210407084238.20443-6-apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 19 May 2021 16:29:11 +0000
Subject: Re: [Nouveau] [PATCH v8 5/8] mm: Device exclusive memory access
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

On Wed, Apr 07, 2021 at 06:42:35PM +1000, Alistair Popple wrote:

[...]

> +static bool try_to_protect(struct page *page, struct mm_struct *mm,
> +			   unsigned long address, void *arg)
> +{
> +	struct ttp_args ttp = {
> +		.mm = mm,
> +		.address = address,
> +		.arg = arg,
> +		.valid = false,
> +	};
> +	struct rmap_walk_control rwc = {
> +		.rmap_one = try_to_protect_one,
> +		.done = page_not_mapped,
> +		.anon_lock = page_lock_anon_vma_read,
> +		.arg = &ttp,
> +	};
> +
> +	/*
> +	 * Restrict to anonymous pages for now to avoid potential writeback
> +	 * issues.
> +	 */
> +	if (!PageAnon(page))
> +		return false;
> +
> +	/*
> +	 * During exec, a temporary VMA is setup and later moved.
> +	 * The VMA is moved under the anon_vma lock but not the
> +	 * page tables leading to a race where migration cannot
> +	 * find the migration ptes. Rather than increasing the
> +	 * locking requirements of exec(), migration skips
> +	 * temporary VMAs until after exec() completes.
> +	 */
> +	if (!PageKsm(page) && PageAnon(page))
> +		rwc.invalid_vma = invalid_migration_vma;
> +
> +	rmap_walk(page, &rwc);
> +
> +	return ttp.valid && !page_mapcount(page);
> +}

I raised a question in the other thread regarding fork():

https://lore.kernel.org/lkml/YKQjmtMo+YQGx%2FwZ@t490s/

While I suddenly noticed that we may have similar issues even if we fork()
before creating the ptes.

In that case, we may see multiple read-only ptes pointing to the same page.  We
will convert all of them into device exclusive read ptes in rmap_walk() above,
however how do we guarantee after all COW done in the parent and all the childs
processes, the device owned page will be returned to the parent?

E.g., if parent accesses the page earlier than the children processes
(actually, as long as not the last one), do_wp_page() will do COW for parent on
this page because refcount(page)>1, then the page seems to get lost to a random
child too..

To resolve all these complexity, not sure whether try_to_protect() could
enforce VM_DONTCOPY (needs madvise MADV_DONTFORK in the user app), meanwhile
make sure mapcount(page)==1 before granting the page to the device, so that
this will guarantee this mm owns this page forever, I think?  It'll simplify
fork() too as a side effect, since VM_DONTCOPY vma go away when fork.

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
