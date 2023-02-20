Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2047869CFB5
	for <lists+nouveau@lfdr.de>; Mon, 20 Feb 2023 15:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB49110E1D6;
	Mon, 20 Feb 2023 14:50:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2F810E120
 for <nouveau@lists.freedesktop.org>; Mon, 20 Feb 2023 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676904601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14aOzXv8/LFbctYEfZwWWmrtrURJsidYi3oSxaFz0Xw=;
 b=W7utZUb+//mYlIVvizHkahjFJknb2yDNePjDFCSemrxS6HSYp0OEntkzFpIJVZkv/k7uyR
 nIIVtFhg0WKqWvR70reBoPiMoeNie7LBlx1TwfbweYzMeDz6HFKmJuaj+FqwUZt6pvUUXD
 pohqJli5lk00+o0iM7qPZWrEkPVkCO4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-AAkqfDkbNziWueqdWmxrGg-1; Mon, 20 Feb 2023 09:49:58 -0500
X-MC-Unique: AAkqfDkbNziWueqdWmxrGg-1
Received: by mail-ed1-f69.google.com with SMTP id
 g24-20020a056402321800b004ace77022ebso2095274eda.8
 for <nouveau@lists.freedesktop.org>; Mon, 20 Feb 2023 06:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=14aOzXv8/LFbctYEfZwWWmrtrURJsidYi3oSxaFz0Xw=;
 b=RhVIQ1TV79uiBf3TIyqNinx8rOj8i0VPXKCD3+eEmTY9wx4odmG0LlcPexo9Ii/Pb3
 BsiG9JxVjN1PIztrN3GPkYr7qd+hRUrKzM170xbrzxCBk+YkWMpiKgygXCgn/6Evt6A3
 TexS6P6Cj6Z8Bfbm92WaQRfvoAMflcEDTLkSO8SK0CF7EX3sCP48EXUNGINkhERrfF0+
 QcUp7iiihwOHequ1VJLxQFhUJTkaSORYMiUeo4v/P0VhH5Evn1cXbdCvYTlTYi0K0VAH
 ZqKAi2geODIHmoQTj/8CtU2UqXmnsz9LmJdIynn1ErWx64oUYMjcXOJgNMD+umxcwuif
 ybAg==
X-Gm-Message-State: AO0yUKWu/smaBhjQHoQH7fgnww47Ct5oOVDz+x6k7LfYxk83P1oI9/8i
 Qh/KidZKA4o8pOCCGwP0CJhfJMws3E+6Yp/P2YPVJqbCav+sZLjrFhWwrBcCQEiNyPvc0pp4XMg
 tlPOGZbBbd7+KW8mFfpA1iVyUXg==
X-Received: by 2002:a17:906:c451:b0:88b:4962:b72f with SMTP id
 ck17-20020a170906c45100b0088b4962b72fmr7384962ejb.20.1676904597385; 
 Mon, 20 Feb 2023 06:49:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+98u/y2Cal3np2ksbwfkOOCjcq6rtCsH8aYGEsMo5bVtK+OVJWU6UbYetsNggJNxfOhh/MAw==
X-Received: by 2002:a17:906:c451:b0:88b:4962:b72f with SMTP id
 ck17-20020a170906c45100b0088b4962b72fmr7384942ejb.20.1676904597149; 
 Mon, 20 Feb 2023 06:49:57 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jr14-20020a170906a98e00b008af574fbfc2sm5934451ejb.33.2023.02.20.06.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:49:56 -0800 (PST)
Message-ID: <3bb02ec3-4d19-9135-cabc-26ed210f7396@redhat.com>
Date: Mon, 20 Feb 2023 15:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Matthew Wilcox <willy@infradead.org>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-5-dakr@redhat.com>
 <Y+/Xn11dfdn7SfBD@casper.infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y+/Xn11dfdn7SfBD@casper.infradead.org>
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

On 2/17/23 20:38, Matthew Wilcox wrote:
> On Fri, Feb 17, 2023 at 02:44:10PM +0100, Danilo Krummrich wrote:
>> Generic components making use of the maple tree (such as the
>> DRM GPUVA Manager) delegate the responsibility of ensuring mutual
>> exclusion to their users.
>>
>> While such components could inherit the concept of an external lock,
>> some users might just serialize the access to the component and hence to
>> the internal maple tree.
>>
>> In order to allow such use cases, add a new flag MT_FLAGS_LOCK_NONE to
>> indicate not to do any internal lockdep checks.
> 
> I'm really against this change.
> 
> First, we really should check that users have their locking right.
> It's bitten us so many times when they get it wrong.

In case of the DRM GPUVA manager, some users might serialize the access 
to the GPUVA manager and hence to it's maple tree instances, e.g. 
through the drm_gpu_scheduler. In such a case ensuring to hold a lock 
would be a bit pointless and I wouldn't really know how to "sell" this 
to potential users of the GPUVA manager.

> 
> Second, having a lock allows us to defragment the slab cache.  The
> patches to do that haven't gone anywhere recently, but if we drop the
> requirement now, we'll never be able to compact ranges of memory that
> have slabs allocated to them.
> 

Not sure if I get that, do you mind explaining a bit how this would 
affect other users of the maple tree, such as my use case, the GPUVA 
manager?

