Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA85EE86E
	for <lists+nouveau@lfdr.de>; Wed, 28 Sep 2022 23:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC0B10E997;
	Wed, 28 Sep 2022 21:39:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE11C10E97F
 for <nouveau@lists.freedesktop.org>; Wed, 28 Sep 2022 21:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664401162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZVwlHkJX+CA2MdLV8ui7Hgvltct3SaTb4zc3R8SWOA=;
 b=bQ0AlrFcMiaeaRe0k2Gaj4l761LEtVryrcl8UK41CtkgAuMbt0Q0mAHas9UbMrCAspmOjB
 gkxaZeUHjosfeLdxKUZxquox7kQ6WH9lA8AM6ehkndlT621DqpDU0yDLU3yLExSW4ZFyCj
 vcQe1Ys7xR8nTpfxuXVYW8flwiMGb+4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-3DFROlX6MPm9K0teQD0SKg-1; Wed, 28 Sep 2022 17:39:20 -0400
X-MC-Unique: 3DFROlX6MPm9K0teQD0SKg-1
Received: by mail-qt1-f199.google.com with SMTP id
 fz10-20020a05622a5a8a00b0035ce18717daso9733037qtb.11
 for <nouveau@lists.freedesktop.org>; Wed, 28 Sep 2022 14:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lZVwlHkJX+CA2MdLV8ui7Hgvltct3SaTb4zc3R8SWOA=;
 b=7a9KZNcf6+jT/cTw+2Y68mcxXKUnHIUKfd5F0oZnFXjy0KbmtYF8AnkDMKjxyWZb1z
 A4gWs596OV5C1SJry7LOJETrJfk3j+tRw3SyWF205KUFgcHyi/ktFJ+Mrm9TN8AYsTpG
 OWuNYrUkjZ1pZ/xjEaqgJsHikZDskfiTrjOQGYKnDchT50CxbHxwuSHbLcEhSkswUnfV
 cdZ2deEB9PT6jdUmZDNbB53553vsRNQmJkDQb31MyGD+JNxhWn/0kYirm9cSVbFC0sUz
 7jCMs81Djeq9vhr7kIs45Eo+jgmIqidiy+EF4lg38hHNAOtsYIFTNO0BjcnJlzqYwIEf
 7q1w==
X-Gm-Message-State: ACrzQf3NJsiCYysocgMAVmubxoytjKB07rU0XjUUGEdjJ7f60GZyW2Ck
 cgQJz7IwOOKlErXtQczV6Rk6wq4/FMEaAwdZjeO6h49VyWNkLOUlkTHQ7AptJzScCjRXJyQqX16
 /ihb4c4TzufVczlOivwZ9h/TGBw==
X-Received: by 2002:ac8:5d8b:0:b0:35b:b035:9573 with SMTP id
 d11-20020ac85d8b000000b0035bb0359573mr28229991qtx.632.1664401160246; 
 Wed, 28 Sep 2022 14:39:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+NTBF2OvbAgxteoflWFSd6erD1BpZf1mrqbddCj+mgL2acOrz19fID/cOV8yI3Qia+7pfGg==
X-Received: by 2002:ac8:5d8b:0:b0:35b:b035:9573 with SMTP id
 d11-20020ac85d8b000000b0035bb0359573mr28229957qtx.632.1664401159952; 
 Wed, 28 Sep 2022 14:39:19 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::feb? ([2600:4040:5c48:e00::feb])
 by smtp.gmail.com with ESMTPSA id
 bs13-20020a05620a470d00b006a6ebde4799sm3987020qkb.90.2022.09.28.14.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 14:39:18 -0700 (PDT)
Message-ID: <139a402b4f9a09a4e89b0c0b0e556014ae7a8b83.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Date: Wed, 28 Sep 2022 17:39:17 -0400
In-Reply-To: <87k05plm9j.fsf@nvdebian.thelocal>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <072e1ce590fe101a4cdbd5e91b1702efebb6d0fd.1664171943.git-series.apopple@nvidia.com>
 <881735bda9b1ba0ecf3648af201840233508f206.camel@redhat.com>
 <6ff9dcc5-c34b-963f-f5e7-7038eecae98b@nvidia.com>
 <87k05plm9j.fsf@nvdebian.thelocal>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 6/7] nouveau/dmem: Evict device private memory
 during release
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
Cc: Alex Sierra <alex.sierra@amd.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Re comments about infinite retry: gotcha, makes sense to me.

On Tue, 2022-09-27 at 09:45 +1000, Alistair Popple wrote:
> John Hubbard <jhubbard@nvidia.com> writes:
> 
> > On 9/26/22 14:35, Lyude Paul wrote:
> > > > +	for (i = 0; i < npages; i++) {
> > > > +		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
> > > > +			struct page *dpage;
> > > > +
> > > > +			/*
> > > > +			 * _GFP_NOFAIL because the GPU is going away and there
> > > > +			 * is nothing sensible we can do if we can't copy the
> > > > +			 * data back.
> > > > +			 */
> > > 
> > > You'll have to excuse me for a moment since this area of nouveau isn't one of
> > > my strongpoints, but are we sure about this? IIRC __GFP_NOFAIL means infinite
> > > retry, in the case of a GPU hotplug event I would assume we would rather just
> > > stop trying to migrate things to the GPU and just drop the data instead of
> > > hanging on infinite retries.
> > > 
> 
> No problem, thanks for taking a look!
> 
> > Hi Lyude!
> > 
> > Actually, I really think it's better in this case to keep trying
> > (presumably not necessarily infinitely, but only until memory becomes
> > available), rather than failing out and corrupting data.
> > 
> > That's because I'm not sure it's completely clear that this memory is
> > discardable. And at some point, we're going to make this all work with
> > file-backed memory, which will *definitely* not be discardable--I
> > realize that we're not there yet, of course.
> > 
> > But here, it's reasonable to commit to just retrying indefinitely,
> > really. Memory should eventually show up. And if it doesn't, then
> > restarting the machine is better than corrupting data, generally.
> 
> The memory is definitely not discardable here if the migration failed
> because that implies it is still mapped into some userspace process.
> 
> We could avoid restarting the machine by doing something similar to what
> happens during memory failure and killing every process that maps the
> page(s). But overall I think it's better to retry until memory is
> available, because that allows things like reclaim to work and in the
> worst case allows the OOM killer to select an appropriate task to kill.
> It also won't cause data corruption if/when we have file-backed memory.
> 
> > thanks,
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

