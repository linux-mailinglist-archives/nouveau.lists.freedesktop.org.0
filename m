Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFF869D245
	for <lists+nouveau@lfdr.de>; Mon, 20 Feb 2023 18:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBE110E755;
	Mon, 20 Feb 2023 17:45:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0571B10E755
 for <nouveau@lists.freedesktop.org>; Mon, 20 Feb 2023 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676915145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0Izq1sT8yQqR3StJyRIa9aUpeGU1pXLanSYRIGX2E8=;
 b=OFh3U3ukHGrRUHPDEkvtltWQOVvNpt7Bp4bI6FDEdfGX/U0q9WjS5PIJx3V6XoD6cjDdCm
 P7RbYYmMgOpvWZzJvJSZaRuLImVh0AYE3KlUBkj4a3U6DpsL5PTuDfBLH5++cjaHSXCTGG
 XWj/ojQ3n+dDtjYX2u4NADDmqFIqTgw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-320-KTezPne0OsGpjBtSpu96hg-1; Mon, 20 Feb 2023 12:45:41 -0500
X-MC-Unique: KTezPne0OsGpjBtSpu96hg-1
Received: by mail-ed1-f70.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so2359710edc.9
 for <nouveau@lists.freedesktop.org>; Mon, 20 Feb 2023 09:45:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p0Izq1sT8yQqR3StJyRIa9aUpeGU1pXLanSYRIGX2E8=;
 b=ze1z3L4Nl0P+p5dgLGTY/kStqAINge+Tv3pQ0t3cC0bqU1L286OfY/LqRn38ESqm7E
 w+4XoA18pOR1s3dk65lyzpLLJalQ9ngWPM+dkSlzVI+8j7Zy8Eb807hPoxs6JYqBDSDQ
 5u+u0ZWOV0zXawvu/c35ifeA3rlEgju0AHvPLx29jRAcBd1yvOVw2i3t59gGL8SBDkTw
 ++kemSctnsAvQWcEEjdvQ/w1NlpMOEmq3NcTuZGNh7iRka9a1mw3vppOXSlpzOX7VSNz
 561x6H8T3dv/YOS2A82x2gyaXw4MACbKKNVtGPgCtqQ1tYIFS2tcomRx0VziC3kO9fWZ
 jHwg==
X-Gm-Message-State: AO0yUKXZQZRh/oqdbWV9HdBYjfbuc/815B4HoaMrbHuftI6Ahx/shmSI
 Zo2D4vPMgudea8XAj5UUrOvlYKWWeLxSzZlw4tZtV4+OzavYKDHlm9tfwluyS8wkfreN/mQK0hj
 2tyD/JgoWKhvT8vp8BT0TubZ3Jw==
X-Received: by 2002:a17:907:94c5:b0:8b1:319c:c29c with SMTP id
 dn5-20020a17090794c500b008b1319cc29cmr13659859ejc.70.1676915140670; 
 Mon, 20 Feb 2023 09:45:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/Ga6rG3Eq1hZqRFlC9SxeuFv04ZCxlmBzWk9HFcUACYcpXem95hxGHCYiEqsp+Ho5tDk/t+w==
X-Received: by 2002:a17:907:94c5:b0:8b1:319c:c29c with SMTP id
 dn5-20020a17090794c500b008b1319cc29cmr13659833ejc.70.1676915140411; 
 Mon, 20 Feb 2023 09:45:40 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a170906561500b008d09b900614sm1826220ejq.80.2023.02.20.09.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 09:45:39 -0800 (PST)
Message-ID: <e43f6acc-175d-1031-c4a2-67a6f1741866@redhat.com>
Date: Mon, 20 Feb 2023 18:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Matthew Wilcox <willy@infradead.org>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-5-dakr@redhat.com>
 <Y+/Xn11dfdn7SfBD@casper.infradead.org>
 <3bb02ec3-4d19-9135-cabc-26ed210f7396@redhat.com>
 <Y/ONYhyDCPEYH1ml@casper.infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y/ONYhyDCPEYH1ml@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-next v2 04/16] maple_tree: add flag
 MT_FLAGS_LOCK_NONE
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
Cc: matthew.brost@intel.com, bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2/20/23 16:10, Matthew Wilcox wrote:
> On Mon, Feb 20, 2023 at 03:00:59PM +0100, Danilo Krummrich wrote:
>> On 2/17/23 20:38, Matthew Wilcox wrote:
>>> On Fri, Feb 17, 2023 at 02:44:10PM +0100, Danilo Krummrich wrote:
>>>> Generic components making use of the maple tree (such as the
>>>> DRM GPUVA Manager) delegate the responsibility of ensuring mutual
>>>> exclusion to their users.
>>>>
>>>> While such components could inherit the concept of an external lock,
>>>> some users might just serialize the access to the component and hence to
>>>> the internal maple tree.
>>>>
>>>> In order to allow such use cases, add a new flag MT_FLAGS_LOCK_NONE to
>>>> indicate not to do any internal lockdep checks.
>>>
>>> I'm really against this change.
>>>
>>> First, we really should check that users have their locking right.
>>> It's bitten us so many times when they get it wrong.
>>
>> In case of the DRM GPUVA manager, some users might serialize the access to
>> the GPUVA manager and hence to it's maple tree instances, e.g. through the
>> drm_gpu_scheduler. In such a case ensuring to hold a lock would be a bit
>> pointless and I wouldn't really know how to "sell" this to potential users
>> of the GPUVA manager.
> 
> This is why we like people to use the spinlock embedded in the tree.
> There's nothing for the user to care about.  If the access really is
> serialised, acquiring/releasing the uncontended spinlock is a minimal
> cost compared to all the other things that will happen while modifying
> the tree.

I think as for the users of the GPUVA manager we'd have two cases:

1) Accesses to the manager (and hence the tree) are serialized, no lock 
needed.

2) Multiple operations on the tree must be locked in order to make them 
appear atomic.

In either case the embedded spinlock wouldn't be useful, we'd either 
need an external lock or no lock at all.

If there are any internal reasons why specific tree operations must be 
mutually excluded (such as those you explain below), wouldn't it make 
more sense to always have the internal lock and, optionally, allow users 
to specify an external lock additionally?

> 
>>> Second, having a lock allows us to defragment the slab cache.  The
>>> patches to do that haven't gone anywhere recently, but if we drop the
>>> requirement now, we'll never be able to compact ranges of memory that
>>> have slabs allocated to them.
>>>
>>
>> Not sure if I get that, do you mind explaining a bit how this would affect
>> other users of the maple tree, such as my use case, the GPUVA manager?
> 
> When we want to free a slab in order to defragment memory, we need
> to relocate all the objects allocated within that slab.  To do that
> for the maple tree node cache, for each node in this particular slab,
> we'll need to walk up to the top of the tree and lock it.  We can then
> allocate a new node from a different slab, change the parent to point
> to the new node and drop the lock.  After an RCU delay, we can free the
> slab and create a larger contiguous block of memory.
> 
> As I said, this is somewhat hypothetical in that there's no current
> code in the tree to reclaim slabs when we're trying to defragment
> memory.  And that's because it's hard to do.  The XArray and maple
> tree were designed to make it possible for their slabs.
> 

