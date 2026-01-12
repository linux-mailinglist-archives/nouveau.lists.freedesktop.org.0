Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39F8D15CF5
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 00:32:04 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 056D610E435;
	Mon, 12 Jan 2026 23:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="JGbSfDoI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 69E7944CA2;
	Mon, 12 Jan 2026 23:23:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768260214;
 b=yL78q0xRgnY6Af32IGQcs3CBUpHgQ9ZX6Cw2U04OePM/UpmdMHVgUK8Ws+YUmKkNdN49/
 1Feo94PMvspkh+Jlll6QM1MYTUFlr88y71Sb/4QtYQyKqAeOUJMe0oL/96FLDqFTuKf5lTQ
 6StRJhzQQTgDJCJH0E6AZm79PI5uP22aMGueZ8P0q7kI9sc3qgYjeXSOBUQv6SyXSpXAadh
 BgVjQZbWGh+tJeIxnIy+TJ+BkaLcL8igSq7EUXsQLGCi5cRtE+jHKcDivHthXwZN5wCy8cp
 XqCkpiwQ4BUkon/n+WxZCRSixLfpA2tCp9j6FH/fP5eIILHhzL6kdxMwHaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768260214; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pIO8dQifpp5qZTd7WcwNdFqrDRKIKFleYoHUkXQdAb0=;
 b=iDGkMdIejHU2jfDTu5lqG6qQe4qLj/89Ye9Wb8zOHuihJH2u+bDf+AejomvZAgQhtoyvO
 95CwtPdH4IzTR4HRD/txJBsPW7qHTDI6BW8TxN4k8XpaXnWW5bZZHMgte+NkXPdqZri6LsI
 MCui7PCQ+yKxzYD838Mwtv9mjYUsjf9mMLdMrJrWbVR6F4APIgJhoNqSOoNjoowVUFTvdRB
 awCEfHCcWcZJSumbkd0n9+AJR3CxBLS7VLnZRLOlJyqduVzpMsS3LhDMhveK7xGYko45rpN
 /miDvM0giKibaYdCxGFKDjSH2PGN/Y5ttOKkoZBUofjMNGQWFE3XUWTDhOTg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2E3DB40382
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 23:23:31 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 230F410E1DA
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 23:31:57 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-8b2d56eaaceso794826885a.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 12 Jan 2026 15:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768260717; x=1768865517;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pIO8dQifpp5qZTd7WcwNdFqrDRKIKFleYoHUkXQdAb0=;
        b=JGbSfDoIxvRl0oHzfDwBWFzrVoZdb0TxFHR7Ubfatxl+nnA3WLVlDTZTdqzD3xfLyU
         CMuC89CNWs5scKjX7F/AOeg5WUFG9XZN9yTLS7nmr0PMlmpiT+Wic+W012Sv8LdPf1K9
         DZoHgzdv1nSwGx4zSe8vIQktwhyXBIBHn08kCU3Dcne+HU5gnMm0Z8Q1+D3PA2jiUVCG
         ia4riBTd1+rMfJdXZu//RfdhiEYMazZduV5wtdrIX6dE4IfthISdAKpNo4/Kvez6j6yj
         f78KNJyRZlVpImkw4LnpS3j/GCoFrn1jFKGN35W15a68R6aYm0MbnJS8rZPdcOusBkhl
         8BWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768260717; x=1768865517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pIO8dQifpp5qZTd7WcwNdFqrDRKIKFleYoHUkXQdAb0=;
        b=N/n7Cs0oknKeFWDCStCQ9Xt01dm7USMGXYZ+lemQHGJdQHBnBYCUfvcolNyohcseP3
         8gafgTZ0eCkT+xJtrkyuGLi5MdGnRaB6qh7VImYY9l/JcX6VVX69CKQai/5mbbh6I5Ar
         W9XJc4H1sYUNMs/GwZkC/0NCHGDZzRGJpRVhxntLQq0pKhO9em02QvybZiH/6T3hel6A
         ibC8Ruqk3Y/hHhw3fswuhsPZEvMnG+WWxa4YCwPPTefhVwuBq6C4rNW365Yfc5z905xO
         XxN72cR+KuKsbtFwfV9d2HHrRX+RAePeRD8PXG+dnKV4StE88uErhscRQs8/zBdKp0Nu
         8W3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6fViBZmqoZ3Qyh5mXclW47SrLja/l6Mz5G+H+JyoS09b+tlR++Zxb5vexpvUrXX9ioG1/GkuW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8I8innXoY8QegQDoT2cStIlLUkeE/QOzDwBLkviQ+2MWMKNz8
	TBVdjfpC3j4NTpexgFO7kOHZfXgvqcGdhUtgWYJHyqmbZxrE8kQNPWTeJKJEOib/7Ak=
X-Gm-Gg: AY/fxX6ZJUeHQkJCMCf/YPMTW6lugp+WwpRhiMzfNMFvFuNz8EkM5G8Vjg/neDLuSw+
	Ll/IxwpIZ4PQ4LgeE+lZJ2KRKi6MKjabPwdAejd8iTvfglwagLeo5BGJ9hbq6+loui+3Mx8wRoo
	/Za+Td6m/b83wTZMUTiSHUUWbpVQOWXVRduSmhOUpqiIDeP8Bjo7ajlaLuTINkKxQilQhHGJIRL
	wyYeE80H5rtkFxVPK1Hr2S3hgX64KCyh9Qe/XiG92/IJMn0OfuEAVZ2RZDLTbEMd4ny7Aoxsh9F
	7fToObtG7yLgVg4R/jXd4Nugndb9TU1F0JIjcAIDk1F1c3x18Zb6TpbqPWbFIZQ+fGyU3ALHZfz
	5fWCCjIPSeSXaAp+bqL6o06s2bbux3Sy2IQJkL1CMozxNlCBXztAqxUm9evt1TE20WpLpTP+C/M
	8jezm0AIEf++VKTh21cXRKvkAS3aGdzIg8m0xmsBD64EvwwAXOR9UEbsf9c8kgGd6E06U=
X-Google-Smtp-Source: 
 AGHT+IHEv3oyWJcb06Rw4VjhDeFEk4R9SXi3D7aPoLG3khcVAljGyaq9fJ2LebD88CvTcTHK3Zmx+A==
X-Received: by 2002:a05:620a:3952:b0:89e:99b3:2eaa with SMTP id
 af79cd13be357-8c389375870mr2741069685a.8.1768260716611;
        Mon, 12 Jan 2026 15:31:56 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f51bf8csm1591462585a.28.2026.01.12.15.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 15:31:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfRO6-00000003evB-2tne;
	Mon, 12 Jan 2026 19:31:54 -0400
Date: Mon, 12 Jan 2026 19:31:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112233154.GM745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <aWVsUu1RBKgn0VFH@lstrano-desk.jf.intel.com>
 <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
Message-ID-Hash: AUCMNM7RY2OUVGV3T6332VO6PMEQ6CZA
X-Message-ID-Hash: AUCMNM7RY2OUVGV3T6332VO6PMEQ6CZA
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Brost <matthew.brost@intel.com>,
 Matthew Wilcox <willy@infradead.org>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AUCMNM7RY2OUVGV3T6332VO6PMEQ6CZA/>
Archived-At: <https://lore.freedesktop.org/20260112233154.GM745888@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jan 12, 2026 at 06:15:26PM -0500, Zi Yan wrote:
> > We could move the call to free_zone_device_folio_prepare() [1] into the
> > driver-side implementation of ->folio_free() and drop the order argument
> > here. Zi didn’t particularly like that; he preferred calling
> > free_zone_device_folio_prepare() [2] before invoking ->folio_free(),
> > which is why this patch exists.
> 
> On a second thought, if calling free_zone_device_folio_prepare() in
> ->folio_free() works, feel free to do so.

I don't think there is anything "prepare" about
free_zone_device_folio_prepare() it effectively zeros the struct page
memory - ie undoes some amount of zone_device_page_init() and AFAIK
there are only two reasons to do this:

 1) It helps catch bugs where things are UAF'ing the folio, now they
    read back zeros (it also creates bugs where zero might be OK, so
    you might be better to poison it under a debug flag)

 2) It avoids the allocate side having to zero the page memory - and
    perhaps the allocate side is not doing a good job of this right now
    but I think you should state a position why it makes more sense for
    the free side to do this instead of the allocate side.

    IOW why should it be mandatory to call
    free_zone_device_folio_prepare() prior to zone_device_page_init()
    ?

Certainly if the only reason you are passing the order is because the
core code zero'd the order too early, that doesn't make alot of sense.

I think calling the deinit function paired with
zone_device_page_init() within the driver does make alot of sense and
I see no issue with that. But please name it more sensibly and
describe concretely why it should be split up like this.

Because what I see is you write to all the folios on free and then
write to them all again on allocation - which is 2x the cost that is
probably really needed...

Jason
