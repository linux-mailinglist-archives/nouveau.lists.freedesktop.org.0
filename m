Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF6D3A08F8
	for <lists+nouveau@lfdr.de>; Wed,  9 Jun 2021 03:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECE16EC72;
	Wed,  9 Jun 2021 01:24:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D836EC18
 for <nouveau@lists.freedesktop.org>; Tue,  8 Jun 2021 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623165416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o58aRI1nAkDOuKYCfrK2Zy/zY+ckaGTYEPwd2qo+nAA=;
 b=WjFyDXW5TzU4f4aG2eTBImx+7uJLrTLZ1TvMRGmw+IPRJjjlBIpvOTqYlqIFiocVD0157/
 DQ6uHmTCDldm7Yh18EON/MLLDeNDe5fuEB7hSxLq5JTRdnQJbSkzg8JNila1Pzi6bX7a26
 4W8qbKK2z5hsqQxCiMw0PdjmOhDVpdo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-wiAnCGo9ObaOLuYL9bJ4cg-1; Tue, 08 Jun 2021 11:16:55 -0400
X-MC-Unique: wiAnCGo9ObaOLuYL9bJ4cg-1
Received: by mail-qk1-f197.google.com with SMTP id
 v16-20020ae9e3100000b02903aafadba721so876488qkf.6
 for <nouveau@lists.freedesktop.org>; Tue, 08 Jun 2021 08:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o58aRI1nAkDOuKYCfrK2Zy/zY+ckaGTYEPwd2qo+nAA=;
 b=F3mtzAm6moMIHNctXjFF57FphpCjvAuQHf7fewtXeCwQIdWd05LzZwOWtWn7IVjC55
 xeBxVzCW6MzSHRcbqwF00zV4HZ0xFTr2jAGlB81u+jo7ajaB8A9XnjbrPiHVXpdl98NI
 HV66Vn9wWHFIpieCPVHoKFZONRgkz6kfcfceFNwWTtaJpYSaJhhDnUqZN6Cx4TuCX82c
 xY+LsGZBhTkdht3IzEtPERtHZ8A4ykVzOHPwLVABN81vpaLPQb1zBROWJSp1aeHvjZ14
 bFI1MuddsRrMyTXx4IgEKo8dAh2SNMezkFCBr0E0ZkFAb8PuJfnrdpm8eBqou5oQUVwG
 2bLA==
X-Gm-Message-State: AOAM531jQ9HnUqSeqkuZEUGvVNhbkDtsxD3pZs2aj4hR++2+m6Sje8Nc
 yyRHSsmKNmnEUUHJywO/Vd2EiidiVMmJ4WDDTRbIqS2b7EfAtOdaT4u2oq4CjraLVjXNFRR2d6R
 W1+WjCQKdOV7GY5IXXIqaF8TIOQ==
X-Received: by 2002:a05:620a:408f:: with SMTP id
 f15mr21924732qko.398.1623165414858; 
 Tue, 08 Jun 2021 08:16:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBLlJH23DxgLDX/p84+mzCKOsdataYBzhyEZq9wfQJJoaRz9EMetGKzWGtOqIiIcaJr3BbOg==
X-Received: by 2002:a05:620a:408f:: with SMTP id
 f15mr21924712qko.398.1623165414615; 
 Tue, 08 Jun 2021 08:16:54 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id e20sm121010qtr.55.2021.06.08.08.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 08:16:53 -0700 (PDT)
Date: Tue, 8 Jun 2021 11:16:52 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YL+J5NN2yRKjyEeq@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <20210607075855.5084-6-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210607075855.5084-6-apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 09 Jun 2021 01:24:46 +0000
Subject: Re: [Nouveau] [PATCH v10 05/10] mm: Rename migrate_pgmap_owner
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
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 05:58:50PM +1000, Alistair Popple wrote:
> MMU notifier ranges have a migrate_pgmap_owner field which is used by
> drivers to store a pointer. This is subsequently used by the driver
> callback to filter MMU_NOTIFY_MIGRATE events. Other notifier event types
> can also benefit from this filtering, so rename the
> 'migrate_pgmap_owner' field to 'owner' and create a new notifier
> initialisation function to initialise this field.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
