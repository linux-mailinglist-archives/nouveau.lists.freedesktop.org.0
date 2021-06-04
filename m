Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E139BBF4
	for <lists+nouveau@lfdr.de>; Fri,  4 Jun 2021 17:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596F96E9F8;
	Fri,  4 Jun 2021 15:34:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC536F617
 for <nouveau@lists.freedesktop.org>; Fri,  4 Jun 2021 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622820055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4AbIlLedm5Mu+ovdpvNjPfOsXH7m99kQNtIejaRsUUU=;
 b=aeqKdawg7sPeFs5OAk/SZXNhGlTx0+oUowDFRIqBJlbei1qvU7oefc7LKk7MjK621tZebS
 iTKdhb46fY2pfj6P/zWd/cqLVJgaSXXMMuqrvDLycyJVSFcUdEtnYUNpPbr4g06Qgk/tdu
 uFLbyEB8tl/hcZHUEcF5An6yyjXiZyk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-J4Ihykw8M9SmR0zV_mWeIA-1; Fri, 04 Jun 2021 11:20:51 -0400
X-MC-Unique: J4Ihykw8M9SmR0zV_mWeIA-1
Received: by mail-qk1-f198.google.com with SMTP id
 o6-20020a05620a1106b02903a9f97c808bso4000061qkk.1
 for <nouveau@lists.freedesktop.org>; Fri, 04 Jun 2021 08:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4AbIlLedm5Mu+ovdpvNjPfOsXH7m99kQNtIejaRsUUU=;
 b=UFakhNpU3OMuB1woS9Yx0T5GYtNYwBPMMP3tbC86VvcIV3xtRZE1LiKo30XaeN0RAB
 JfHuOhhdrzQBIN7jINizS9/8VD4WpSxr7Dfc7Kd+BAbyA2MS93lTK/ZUtmobwoOqQW2x
 mQun2ivRIbpEpRhN9SJMKtE1ILI5e6ChDYWheS8NXpSJ1vbMf0Jy9ruT4QELFcYmqdNf
 C+este3Gj7VRpVVUKuzoSMqI5Drlq4gvk7e7xv9gwHsSoSk39VdAxmx2IkqEPLwhPG42
 DXxGlvfCIxaKuoCCrRZpbIMuz9VYvqWIKVc4+B3tDaydFpYYvGaxyVvze9BQoarPTtEn
 EYkA==
X-Gm-Message-State: AOAM531XPXyhOtTCZj9l9of4Ak5G+0oFWSw7f0JXFOSWCMsQQjG3D+jB
 m+JSkWeSfiKqpqg2Cm7xPtl+PLJoRLuXb0y9Tmnc0vGwMYO0DtrocbLXt98vdcWIOilTNsuC2JB
 F5/f7IRrkgVVFRHFEPlVUcYRqbg==
X-Received: by 2002:a37:911:: with SMTP id 17mr2506635qkj.436.1622820051431;
 Fri, 04 Jun 2021 08:20:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSkb15icJCjCC2a0yzUkFB8Tk/1b3Gxyat2dgZri3GuoK2EOI4ZaPq1ePBkTLwQGSCPYLtvg==
X-Received: by 2002:a37:911:: with SMTP id 17mr2506604qkj.436.1622820051225;
 Fri, 04 Jun 2021 08:20:51 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id x9sm3701082qtf.76.2021.06.04.08.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:20:50 -0700 (PDT)
Date: Fri, 4 Jun 2021 11:20:49 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YLpE0U789jvD2zxN@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <3853054.AI2YdRgKcH@nvdebian> <YLjrjJXMP9Y3bvej@t490s>
 <10231977.pWpf7cJbZl@nvdebian>
MIME-Version: 1.0
In-Reply-To: <10231977.pWpf7cJbZl@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 04 Jun 2021 15:34:13 +0000
Subject: Re: [Nouveau] [PATCH v9 07/10] mm: Device exclusive memory access
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
 nouveau@lists.freedesktop.org, Balbir Singh <bsingharora@gmail.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jgg@nvidia.com, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 11:07:42AM +1000, Alistair Popple wrote:
> On Friday, 4 June 2021 12:47:40 AM AEST Peter Xu wrote:
> > External email: Use caution opening links or attachments
> > 
> > On Thu, Jun 03, 2021 at 09:39:32PM +1000, Alistair Popple wrote:
> > > Reclaim won't run on the page due to the extra references from the special
> > > swap entries.
> > 
> > That sounds reasonable, but I didn't find the point that stops it, probably
> > due to my limited knowledge on the reclaim code.  Could you elaborate?
> 
> Sure, it isn't immediately obvious but it ends up being detected at the start 
> of is_page_cache_freeable() in the pageout code:
> 
> 
> static pageout_t pageout(struct page *page, struct address_space *mapping)
> {
> 
> [...]
> 
> 	if (!is_page_cache_freeable(page))
> 		return PAGE_KEEP;

I did look at pageout() but still missed this small helper indeed (while it's
so important to know..), thanks!

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
