Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924803893C6
	for <lists+nouveau@lfdr.de>; Wed, 19 May 2021 18:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA666EE35;
	Wed, 19 May 2021 16:29:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76EA6ED95
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 12:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621426872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iT4YtjBsBt0s/M51Kj84dkt6amzmmMXBn/lNki8qQn0=;
 b=aadB3nSK7zJu8MLuvZBnwJIwxcvxXFffv3horplEQW35HfRM12D6zRbCkuUb1AeVSk0Nrt
 XAPy3eFD3993+UOMa2COO5RBmilwY5BRi24cg/Jkq7JGByfjJO+QUgoNqe6YhlUEDLEmI1
 JioP1UtKeJ9uyGOd6/goD5mhUaymIrs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-TBw99y3UOn-xSlhZBfuxAw-1; Wed, 19 May 2021 08:21:10 -0400
X-MC-Unique: TBw99y3UOn-xSlhZBfuxAw-1
Received: by mail-qv1-f69.google.com with SMTP id
 e2-20020ad442a20000b02901f3586a14easo2669841qvr.12
 for <nouveau@lists.freedesktop.org>; Wed, 19 May 2021 05:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iT4YtjBsBt0s/M51Kj84dkt6amzmmMXBn/lNki8qQn0=;
 b=GoXStMCnrqoOcJ283RcWcE7+4+0QmNtCzUDceWx8zI0EtHrXnlVvpGdc0zTqpA+UuR
 n0S4mtH1wnYrwaEeNXpj5yFHGh66rGFfM+gARa07P9tgzXdv84gAZo3jC38Ei6G9AzzK
 SW55qTQWPWwuJo7++i566IpV/ChBOAQyJkKiwxDq+W8cLgleg8Ssnncm1uk/gBOov89z
 0RYZ7fTSD33MEfxp1aSR1PWFpxhHDtWjC2j2W6TpZXL7llAqZ0fLxj9d2RVS3B+1VYqq
 GvCwUibW2Gv1JMwweKkClRFNJPa0Q/8grehEiRGQYSwW5reYuPQsxU8GJuTN+t4NphSH
 2LXw==
X-Gm-Message-State: AOAM530Iml1RxS1VhL0yB7T4nPUZMrFu6rt8YJTTZpjf4nhfSzEIyZMI
 eY+EVg47oyYY8FAiCcZG7ziIi7gtzpkp4BBmdtHZLDCocZSSxl4AmlKm4wCdljg4872A9b2x4iB
 dV/+MRy7rlkaj0xodI9VxiO/7wg==
X-Received: by 2002:a05:620a:818:: with SMTP id
 s24mr7432106qks.425.1621426869767; 
 Wed, 19 May 2021 05:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym25A+8CZrSnha27nfGC/bkh618yND6m6b6Lo8EgcNF6Oma7UyN8ZK+yut+/9S1ILrFjJgwA==
X-Received: by 2002:a05:620a:818:: with SMTP id
 s24mr7432081qks.425.1621426869529; 
 Wed, 19 May 2021 05:21:09 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id o10sm15018668qki.72.2021.05.19.05.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:21:09 -0700 (PDT)
Date: Wed, 19 May 2021 08:21:08 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YKUCtA4FrfmkNrn7@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <47694715.suB6H4Uo8R@nvdebian> <YKP5Dj4Q/riGGc43@t490s>
 <2217153.lfGrokb94b@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2217153.lfGrokb94b@nvdebian>
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

On Wed, May 19, 2021 at 09:35:10PM +1000, Alistair Popple wrote:
> I think the approach you are describing is similar to what 
> migrate_vma_collect()/migrate_vma_unamp() does now and I think it could be 
> made to work. I ended up going with the GUP+unmap approach in part because 
> Christoph suggested it but primarily because it required less code especially 
> given we needed to call something to fault the page in/break COW anyway (or 
> extend what was there to call handle_mm_fault(), etc.).

I see, thank. Would you mind add a short paragraph in the commit message
talking about these two solutions and why we choose the GUP way?

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
