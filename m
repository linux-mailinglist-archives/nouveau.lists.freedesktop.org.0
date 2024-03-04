Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC5687092A
	for <lists+nouveau@lfdr.de>; Mon,  4 Mar 2024 19:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F63F112429;
	Mon,  4 Mar 2024 18:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PBPztpGE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B5111242A
 for <nouveau@lists.freedesktop.org>; Mon,  4 Mar 2024 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709575867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBjepeaDd7+e3s7rKO9VR+CPderTVwZuDQuLnzWRm24=;
 b=PBPztpGE6359tsSshRY0mmMoxBUTuDv1XvGekBhzSQzvNdEQXvyBKEGb7ltKYsYqmXkZGV
 wytWSv62f/C8b4jdZa8ltVjM3CN740YEjta0RyWR2mbpowxFIWtBi95zGZdCwztYAfo+DP
 zjGJU+ee1i9mh9bkOi+ROx/ApY+7mAc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-F0eRv9SVNlGByNMXME1Geg-1; Mon, 04 Mar 2024 13:10:59 -0500
X-MC-Unique: F0eRv9SVNlGByNMXME1Geg-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-565862cc48fso5831451a12.1
 for <nouveau@lists.freedesktop.org>; Mon, 04 Mar 2024 10:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709575858; x=1710180658;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vBjepeaDd7+e3s7rKO9VR+CPderTVwZuDQuLnzWRm24=;
 b=ixYIia4/NQETOuNeJRm2awTZa/whT0nBFgKWR196221FdaNyE/xc0uJjiUhYMqW/+r
 RBANkHODPobeM7Je8QfcjLjOOd2sUIBfskVWkTxi5WXYricjMD2KJ2t/dffwJFEj7CwU
 y58360C5N/27mWV4ke6IFUNPS+PrZ7GRPvVthl2qXxTl0wGa5usKFe5LMGnhcWd1KhxH
 dz7rDwOe0HMH2n4QKb4fllR3Ab8a1fJnZ8fmsgrn4hmqYem0Pm5qAHdFYQfZLSeQuHLR
 ga1Bg2941S56GEkTYrQhBS8dnpP4zqJJeFf+LMB9qXS11dAZtuR5tOrzc/bOcvl/lyoX
 4NlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQswcY973yMd6lMRDq3/86DiFXfkLAuyeL/O/TpLBmHpSzugs3yq1KSnp4tPr7Y7V9XRSZr2aFmkAUiilo1G0fauZjY+1Kjy+EdEERng==
X-Gm-Message-State: AOJu0Yw8IFP+eqppcyjgwKNGbTFh6Wv0VUt7RfPXh0kMBcU2EPBTHU2O
 eusGsZhcd6IjN161gVtJg56V0mu6mEsg8BOVNy/zPX8CyKprEDoOs1xIbJF2N6OiKBzqNmKHd5t
 h5Ut9iLiTRomdL3/ZKTrofPakdVSwpZA8ef6gKgMDQ6+iYTtDvwMApe8krFxfxEI=
X-Received: by 2002:a05:6402:12d6:b0:565:4b37:4578 with SMTP id
 k22-20020a05640212d600b005654b374578mr248031edx.14.1709575858261; 
 Mon, 04 Mar 2024 10:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3t2S0aWyhJ/v1zCmDqncy36MkHWOfwiyAhlwadf3nqgax2jvehgYnODUkmNZDIdWTKSsqoQ==
X-Received: by 2002:a05:6402:12d6:b0:565:4b37:4578 with SMTP id
 k22-20020a05640212d600b005654b374578mr248007edx.14.1709575857934; 
 Mon, 04 Mar 2024 10:10:57 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 m13-20020aa7d34d000000b0056486eaa669sm4910231edr.50.2024.03.04.10.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 10:10:57 -0800 (PST)
Message-ID: <4a3dc556-d7f4-4741-ae5b-6722bd2ce1c1@redhat.com>
Date: Mon, 4 Mar 2024 19:10:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable v6.7] drm/nouveau: don't fini scheduler before
 entity flush
To: Greg KH <greg@kroah.com>
Cc: stable@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>
References: <20240304170158.4206-1-dakr@redhat.com>
 <2024030448-basin-grit-b550@gregkh>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <2024030448-basin-grit-b550@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 3/4/24 18:55, Greg KH wrote:
> On Mon, Mar 04, 2024 at 06:01:46PM +0100, Danilo Krummrich wrote:
>> Cc: <stable@vger.kernel.org> # v6.7 only
> You say 6.7 only, but this commit is in 6.6, so why not 6.6 also?

Good catch, I was sure I originally merged this for 6.7. This fix should indeed
be applied to 6.6 as well. Should have double checked that, my bad.

- Danilo

> 
> thanks,
> 
> greg k-h
> 

