Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF77CD15E3E
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 00:54:20 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A750910E440;
	Mon, 12 Jan 2026 23:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Q2NOZwtF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2B04A44CA9;
	Mon, 12 Jan 2026 23:45:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768261552;
 b=HXI7mq0fQnE1msENoUtRT9udbxD4TV4co93/HhyTDCHS1UWzToBlr3aWfrThD3M68NKGu
 l2faiLdQX7gcYOGv0HKZExrKYAIa5ew434XurV7AybgOt6AJ/T1xWQyhjfzU6RUNwmfVftG
 cxcjvfwRFDFW0m1IHbctitNUXN+u8ujRMpP9vwdjSFzMk8wvx6QsNCVeULOOJiI6Lk0MOPb
 9XvwinFRAtV1RfJ5qZHg91SUQUV7ad7qgzvg8+4nt9hcUvrC+UQ2IreR28C1tNHz892HZmM
 3NP+J+h9mX/qiVXUY3kT2esZcrosavYvhlAOVijOVI9oewVJ2cl9WInGYP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768261552; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vbQpTPqvkNza84fX2uyalXQvb9OzER6/e1aJC0fiWDY=;
 b=zWKNbwfBtjw/F/jwDwWz9cHF2m/dg+E4uUkOyZQ0baGlcfWwruzqeXCS0h4SZS14uO7A3
 Gt7b7zEGWwfab6cBary01YDYR6pO1S1bmLHCqPhwa9wgjXk8R4oTx9mIlP0vYiVTo+IAWKn
 +IW4PtL3dlFaaIsskTiS9EPJJOZrQ3dBpZk89JVQIQgKIMxpSFD9y5CT/6xmq5yY9XzPkxL
 OpvmAha8Cr8V9D8S3SstEMq1zrdY6WXUdL0jg1y0omCDiTwj2KHBisP7dKacHz5YNE8tc6U
 MzytCNH9AjAa2YYIDaW/2fJ8WE2lxGCo8KZSHEr18lOXgA1httfwaTetSk+g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 89C9140382
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 23:45:49 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E84F010E440
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 23:54:16 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-5013d163e2fso401511cf.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 12 Jan 2026 15:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768262056; x=1768866856;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbQpTPqvkNza84fX2uyalXQvb9OzER6/e1aJC0fiWDY=;
        b=Q2NOZwtFeLszSK58JN3g3M62saQEAA7XnwRLb/YuxZuzmq2Eh4Km8kPd77/O7QCIRX
         XFOLTjgGH7xzV/1iMfBj+Vk/rBvYMLwYx2/gdHPUJqZl0X6S+nmsZFBa9ifmSFjMVsza
         aOQunpoTyykCKn7ngM5XRNrkmShLyOEck7n6H3c+ZAs90ImXxPLDtKOcrTjNaKUh+zFs
         fslXXfxn/upVoIia3BxXhvgJ9CrYm7G0sHtcqPS/+XGzMMZKUDpNr1P7ijyBf9uTSF4q
         +I06FMcMoRBia6knvy1IHzQliv48sJL5mygSH3K4SkxC3rK/OoSvpx7qmtFWmqPYDitQ
         e1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768262056; x=1768866856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbQpTPqvkNza84fX2uyalXQvb9OzER6/e1aJC0fiWDY=;
        b=wc7U1BnHwMkkOaJQNXHnY16wLbjb7FZ3ZI7d7smFJJ9AbC6NHOKroaGAlZtPFNELUf
         AIHTEpKTbqtT8+ttihE6ZEUhdXOjxc3nWZtnVl4z489kScOetuwWibGMjIAorZxNcYJa
         cMLP6DjlpURMvT6RAQr20fyoU+DjfiZ3o1MR3C/LVit8NxDqMOiki3T82mgD6gYTvnoF
         Wj7309WQQMNp2/v6+WZ/tTfRY9SvoK3j7I5Zb8F3eVJjWUqa/nWGMP5WIAzATUU+u4Dr
         tjq94+HZ754cIYD3zZzl+ZiB769DSsn47t/iPkevBx7znqzz2mmKoOoHvxE594JADY4d
         ck2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlL5AoCSUkdjgGTg504vVqx/VxG7jedkTSXEVrNcAlXZbBDxpDqrsPNxCCslvllp/BYByiNnmM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEU5wp6L8eAAew/+38C32nntw1ERoVVIMNeeC2Nz6DLUAARetw
	7NHZaDrggXlL6mbZ+SgLNJVpzGlCsLsxzSi9XJT9b1YTMfvCIk5eKXX+9xuWTYcpJXk=
X-Gm-Gg: AY/fxX6EUXkWPMz0vJ30fbHmS89LIY5eiaoexMNHNo8agLC9CUauQzA4KGptHfAUZHK
	zhjkyjvqILDaM6cCg4jsgUSrCwV4V7CBsH+wo1THz5UUyUTUtGhSTipSDwkggv8bHcq5JdYPShb
	0pRILrM8pZ0qrS8vhj20hnVXztywXwLiag2W+E+QIN2LgKgTs3cO2bjo4STmuA8zoFU4Oz9s/BN
	A3yC1OM6BU5dphRmh2amij7w9Mat/peGwaYCDEP/m9GhpOuWb48v+/Oi89eTd4twETIJFCUY6XB
	pYzDnAEUbRUK+YtFRXqvhIZQDTgZ5EwoIcoSoMKpc3bY1vix0fq/f0ArqjLyasNY6SxD1yrbjgX
	z/TS2LZTvDHDNOfxBS+nowlaUBEYzDJ87joAQ5SJ+nNWgzTCESVu3wOHRiV7NjTvpt5cuuw/klV
	VcZ8KGNT8rCeB4lzySQPwtHRiax2FPe0Ya/CdIC9aVFxNbEmqciKkotte1SUAjbdDPLHo=
X-Google-Smtp-Source: 
 AGHT+IFqShnh4nFq4FI+txOqV94h9FNeJmPa4/JUWRJXzRBu2Yp6JXhvTMJ52+U7dVhw4CMApET5TA==
X-Received: by 2002:a05:622a:8d1b:b0:501:3b8c:7d63 with SMTP id
 d75a77b69052e-5013b8c8686mr4698571cf.26.1768262055766;
        Mon, 12 Jan 2026 15:54:15 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ffa8e35dbfsm129011631cf.19.2026.01.12.15.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 15:54:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfRji-00000003fUm-0uFg;
	Mon, 12 Jan 2026 19:54:14 -0400
Date: Mon, 12 Jan 2026 19:54:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112235414.GO745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <aWVsUu1RBKgn0VFH@lstrano-desk.jf.intel.com>
 <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
 <aWWCK0C23CUl9zEq@lstrano-desk.jf.intel.com>
 <fzpd6caij2l73jkdvvmlk4jxlrdbt5ozu4yladpsbdc4c4jvag@d72h42nfolgh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fzpd6caij2l73jkdvvmlk4jxlrdbt5ozu4yladpsbdc4c4jvag@d72h42nfolgh>
Message-ID-Hash: 62IEEYZAXSGOM2ZGA3RD374U2V3Y75MW
X-Message-ID-Hash: 62IEEYZAXSGOM2ZGA3RD374U2V3Y75MW
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
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
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/62IEEYZAXSGOM2ZGA3RD374U2V3Y75MW/>
Archived-At: <https://lore.freedesktop.org/20260112235414.GO745888@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jan 13, 2026 at 10:44:27AM +1100, Alistair Popple wrote:

> Also drivers may have different strategies than just resetting everything back
> to small pages. For example the may choose to only ever allocate large folios
> making the whole clearing/resetting of folio fields superfluous.

+1

Jason
