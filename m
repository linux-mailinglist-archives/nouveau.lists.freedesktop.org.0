Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DEBB185EA
	for <lists+nouveau@lfdr.de>; Fri,  1 Aug 2025 18:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661A110E196;
	Fri,  1 Aug 2025 16:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="oZRpCPhc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8528F10E144
 for <nouveau@lists.freedesktop.org>; Fri,  1 Aug 2025 16:41:01 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4aaaf1a63c1so7086791cf.3
 for <nouveau@lists.freedesktop.org>; Fri, 01 Aug 2025 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1754066460; x=1754671260; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B0ddBwnOmQZLVOzE3sU/BJSF1dO9mMLzFrijfMzZ/2w=;
 b=oZRpCPhctr3J7yMORxx2kTpYPW8xXDL7aCPWiMYZA0AWl0SFLQW6dsDDbpInsl26F4
 OZFzVxLFdqbancfzlxDWl4g8D6tZBHg/tkVb7YxYE1lg8w4ZLec4hHUP6/ljuodrH6co
 9vFkCFxoqAEPVmyN/jdiCpNOizQ9GKs7SrNoXj8ZTQwnkZRki2ipX7O69w/Zeak6qArt
 mmY1kMEGMXxsw3MAcF4vExdMG/oH8ku078SE8I9BmNK5AlLaH/ap4dgwdPUMZyPEDSc4
 27q+NBv5dHik7M4LjXKMawAg//qw/T1o9sdBqvavO+HG+qbDjJH/Hi84t1DM6qHxe2LG
 mMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754066460; x=1754671260;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B0ddBwnOmQZLVOzE3sU/BJSF1dO9mMLzFrijfMzZ/2w=;
 b=s9XC97hy2RgzCETHWgArm5K9Ifxg9o6L3nJt8f/jOg7cZzKt84tuxB2Qi96j1INOB7
 ugrpGhekoH7A9ruwgXdULxicckp4D8Ou1R82wsxhVlOnbJltcrC8KK8BlYMP28OKEslw
 ojYaaYixIj6bZsJNcntyTyRnJZgUZNmcm877HFc+9hs3O34hMeKlPVAPcTcZkXMQfIpW
 oEYzqAlGwt6fkDHQYeZK324PArgeDFgiOGBh7Hp1IR4nK4ze6vLpWFE+TKIX7FdPEZg4
 OBItZBDX/qh01nlQzbCBPrss8o1AxMv/hLCowLBwrZN96SKvbXXVZj9FMNL+ihU/mNkS
 /inA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgR8qRVmr87voXvHLxGkYlfYMurTN3cRSwcoIZtMO+23nqn5HwYVZOA7xqGVtVucNtWAg4jimz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEv3Qhaj1DLG5vrcz5IB6raZiy9zipEsf3nGao6GrKGEQa4DHV
 DD2ausUPcR40c9dhxikzS9ONPRczAWqS4WiF8t0SXdIhx9snwuo0NISxcAbQwbT1V4A=
X-Gm-Gg: ASbGnct1ux5P1NT5IgLOqex2mt5hwQhFEzGhNm25512mCgFgJJsyHT2NZj/0BwiwqXf
 +oYhpaUDKwCxFQqNobrFoyjhL9OV0K8gLOrKhp939jLN/h9k9bplpB0QdIL0HIgXQeYFx9StEOY
 1y3HvwYK1kQNBPkqQhhaPLySdF+2V4HOqxLxq68w9FBbyIVd3T2eO/RwSRVtYpEn9zlD6Lj/yIO
 YqJbZ5iyRnzpBSnTEUEJaCgbLqN04y8iIT8bRNQhUKaxzwMi0MlNqFCzkMWJ5ynS3PxWHliWI/B
 eMWX8zD+EhLyLOZVrBCS14wll2DjtN7Pp0WgXQo3HRX29wFsmikinQAPraDo5c6r8/NnerHmlxW
 hizFsZLA8JjZ/i86bAIc8IzJSd//Wu4E/1zP8cAgBJs+Dpmegys2w0i2cQeKIeNodPGuC
X-Google-Smtp-Source: AGHT+IEy3UJJEisaAsFYVle9oO+qAAIDl2Jx71tj+7ZpM48o/4SMC51lEI3qAmHkBEbK3gRlxWE1yw==
X-Received: by 2002:a05:6214:623:b0:707:641e:e4bb with SMTP id
 6a1803df08f44-70935f66fcemr4291156d6.17.1754066460081; 
 Fri, 01 Aug 2025 09:41:00 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077ca5c23csm23275996d6.40.2025.08.01.09.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 09:40:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uhsoU-00000001379-3cXq;
 Fri, 01 Aug 2025 13:40:58 -0300
Date: Fri, 1 Aug 2025 13:40:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <20250801164058.GD26511@ziepe.ca>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aHpXXKTaqp8FUhmq@casper.infradead.org>
 <20250718144442.GG2206214@ziepe.ca>
 <aH4_QaNtIJMrPqOw@casper.infradead.org>
 <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
 <aIBcTpC9Te7YIe4J@ziepe.ca>
 <cn7hcxskr5prkc3jnd4vzzeau5weevzumcspzfayeiwdexkkfe@ovvgraqo7svh>
 <a3f1af02-ef3f-40f8-be79-4c3929a59bb7@redhat.com>
 <i5ya3n7bhhufpczprtp2ndg7bxtykoyjtsfae6dfdqk2rfz6ix@nzwnhqfwh6rq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i5ya3n7bhhufpczprtp2ndg7bxtykoyjtsfae6dfdqk2rfz6ix@nzwnhqfwh6rq>
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 25, 2025 at 10:31:25AM +1000, Alistair Popple wrote:

> The only issue would be if there were generic code paths that somehow have a
> raw pfn obtained from neither a page-table walk or struct page. My assumption
> (yet to be proven/tested) is that these paths don't exist.

hmm does it, it encodes the device private into a pfn and expects the
caller to do pfn to page.

This isn't set in stone and could be changed..

But broadly, you'd want to entirely eliminate the ability to go from
pfn to device private or from device private to pfn.

Instead you'd want to work on some (space #, space index) tuple, maybe
encoded in a pfn_t, but absolutely and typesafely distinct. Each
driver gets its own 0 based space for device private information, the
space is effectively the pgmap.

And if you do this, maybe we don't need struct page (I mean the type!)
backing device memory at all.... Which would be a very worthwhile
project.

Do we ever even use anything in the device private struct page? Do we
refcount it?

Jason
