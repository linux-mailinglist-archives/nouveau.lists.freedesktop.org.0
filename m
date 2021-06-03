Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E912F39BBF2
	for <lists+nouveau@lfdr.de>; Fri,  4 Jun 2021 17:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98726E108;
	Fri,  4 Jun 2021 15:34:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B9E6F48B
 for <nouveau@lists.freedesktop.org>; Thu,  3 Jun 2021 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622731666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ggwAzDwYsJe761/h5KeyH0+JH3HJIdjU1YmA0yiaMkI=;
 b=c6KbUWHozjlgPRGeKkkVLjeAZIWBPqMyh56ebADi0rfZcqAJGEBYATvwEoUYnfBI9VRW8f
 Gjk4IeEfuXNd/w7x4TXUjO2lOEmf8jgt5gI0IaRTryfSZKkzbgRUPYZn0vYcMtNngguA7V
 mIztC+qrLSMk4ynNtaj0G+X5RfORWt0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-L-h_qU6qNRiRywRkN3Qbog-1; Thu, 03 Jun 2021 10:47:43 -0400
X-MC-Unique: L-h_qU6qNRiRywRkN3Qbog-1
Received: by mail-qt1-f198.google.com with SMTP id
 t25-20020ac865d90000b029024320bc6dc9so3202148qto.9
 for <nouveau@lists.freedesktop.org>; Thu, 03 Jun 2021 07:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ggwAzDwYsJe761/h5KeyH0+JH3HJIdjU1YmA0yiaMkI=;
 b=dT1Mapfh5RumVwt8M/WCSbgF2x4hSM6ZrlEjf1yNEMDfBs9Oi7esLWoyLjvnXGgq0r
 TguoGypx0JKZFoDt1yoUqWOt2a+dY5uzUXH95o2aDh2Q2+L2hALlueKCwt2fDR6YMntv
 qJfN2S8aicxNpJOe0gjCNWZhdZ7M8jNDtlPFz4TIVxc+HLxm41fWaYdt6G73yFLWH8sC
 XO111oTwFbzs8NqafGT/BipRas68afTLB0ipr9JoHmHZJS7iMngmrQ4d//6VNncc/guS
 F8qVfJLq0cJEUbZVTtyv9ibEOX6TYBkLkgxOAL10Zo1PvymsGdYOdLa3M9qNOg22046F
 jVUA==
X-Gm-Message-State: AOAM5331IVAv9fnALxIqbC7YW2mu3wLAjh53xsO6dAmtgDJ0dpoxUBFW
 WGoRM9I3Y61dIenDQE23o5LwDCbEDZR8AIWETNVm1s2NGWvTOhwQ89kYqB4Ittz43BpcKjPR+fA
 fU5bM7iheUyTkZ6/ub22LSdcsfA==
X-Received: by 2002:a37:ae81:: with SMTP id
 x123mr31891341qke.251.1622731662880; 
 Thu, 03 Jun 2021 07:47:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8G2sTC80gzexHAH3BN9zjekxO4BROz6GuR6h2LK/qUHy5QdzjC03iGstjtnqP8uH7ytX0pw==
X-Received: by 2002:a37:ae81:: with SMTP id
 x123mr31891297qke.251.1622731662359; 
 Thu, 03 Jun 2021 07:47:42 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id j28sm2041208qkl.35.2021.06.03.07.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:47:41 -0700 (PDT)
Date: Thu, 3 Jun 2021 10:47:40 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YLjrjJXMP9Y3bvej@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <YLdGXSw0zdiovn4i@balbir-desktop> <YLeXqp/U0DgylI/u@t490s>
 <3853054.AI2YdRgKcH@nvdebian>
MIME-Version: 1.0
In-Reply-To: <3853054.AI2YdRgKcH@nvdebian>
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

On Thu, Jun 03, 2021 at 09:39:32PM +1000, Alistair Popple wrote:
> Reclaim won't run on the page due to the extra references from the special 
> swap entries.

That sounds reasonable, but I didn't find the point that stops it, probably due
to my limited knowledge on the reclaim code.  Could you elaborate?

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
