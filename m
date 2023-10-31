Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B268B7DD4D2
	for <lists+nouveau@lfdr.de>; Tue, 31 Oct 2023 18:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A4810E52A;
	Tue, 31 Oct 2023 17:43:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DB010E501
 for <nouveau@lists.freedesktop.org>; Tue, 31 Oct 2023 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698774196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjb6Yoc/YD3246622wziQ1x01TRFPcmtkNRame8jp4I=;
 b=BpPK5hXsnqC7TxwBsgM+JZCP/G0WpvwwRpAjDuaK23EEI2uH8xd4m10cuAH2lasmfEzaIu
 n8hTg6XYLN5n518Isd6SV3Y57b2/NlLKBTzG0wtRvrsgoKn6LByUdXOjtAORJ9M1uhOAm5
 NeEZMXQyJdvmJ2vc0lFVVGhanK1qGkk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-9cwD4nK-Mx-B2QAfkH0gZQ-1; Tue, 31 Oct 2023 13:43:14 -0400
X-MC-Unique: 9cwD4nK-Mx-B2QAfkH0gZQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9cd789f0284so394551166b.3
 for <nouveau@lists.freedesktop.org>; Tue, 31 Oct 2023 10:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698774193; x=1699378993;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fjb6Yoc/YD3246622wziQ1x01TRFPcmtkNRame8jp4I=;
 b=q8pa1mzeNw32O3Z+YFQ2grlP/VoR/xleElxjv5CdahcOCYyOrJ1IpjXAGeYb7mOEOc
 Qy83C0ehUh8ifDRCbjl+wEGy93kzP0tgip+cLH520ht2xx9E0NlxLGLgKBByeYAGpHm3
 MZY/OTmRKKoovkYMTVdzFDJbKecEdSP74hrA3lGS87OnGPeY2O6GySW1YkFLbcqDL0EE
 AvaiSH3R3TUieT0iXf7BLNAY4uQT1BRNc1wnYkyYdAs9dMQav4S8xyZfhGnPHjryMP+r
 pPWYWttUBUk7hIcRNyN/9ZtnfvUMYjtAF6XDuTEa1JA+y0mq8QuHsdR92f4dEC2FiJEt
 mZBw==
X-Gm-Message-State: AOJu0YxFR1VV9dq7pB7VreYvVf+pCGpdQwSalbybDKoHJVPeKBWODje4
 wNaND0ssFZpZHo9WtWCf3Vb0n5C1gHJpS2Z3/4+tenX4if1aLrfThZOUfWnbt8a4cWCx4i05bHA
 k1h4CMEg4lJOxGTGAikLG10vHGA==
X-Received: by 2002:a17:907:806:b0:9b2:b269:d563 with SMTP id
 wv6-20020a170907080600b009b2b269d563mr31364ejb.63.1698774193026; 
 Tue, 31 Oct 2023 10:43:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBZIn/2FMYdWi84Y1OkpcqPPwyotpPSJ5wkgv3ilk1lzE2lciLdSBr2N55hmshj9afdG5z/w==
X-Received: by 2002:a17:907:806:b0:9b2:b269:d563 with SMTP id
 wv6-20020a170907080600b009b2b269d563mr31345ejb.63.1698774192750; 
 Tue, 31 Oct 2023 10:43:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 pk24-20020a170906d7b800b009c74c56d71dsm1334995ejb.13.2023.10.31.10.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 10:43:12 -0700 (PDT)
Message-ID: <3b78aa2c-91a8-4031-a4e8-1f330139cd9f@redhat.com>
Date: Tue, 31 Oct 2023 18:43:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@gmail.com,
 daniel@ffwll.ch, matthew.brost@intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-5-dakr@redhat.com>
 <f00a4975cf32c3ae28124343a2c994acda083829.camel@linux.intel.com>
 <87zfzz3thp.fsf@intel.com> <1e2acafb-fbc3-4256-b1e1-3fe6c47b1ef2@redhat.com>
 <6cf7459aa0332d6fc3c4764f66a83c6a3825348f.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <6cf7459aa0332d6fc3c4764f66a83c6a3825348f.camel@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v7 4/7] drm/gpuvm: add an
 abstraction for a VM / BO combination
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/31/23 17:50, Thomas Hellström wrote:
> On Tue, 2023-10-31 at 17:30 +0100, Danilo Krummrich wrote:
>> On 10/31/23 12:45, Jani Nikula wrote:
>>> On Tue, 31 Oct 2023, Thomas Hellström
>>> <thomas.hellstrom@linux.intel.com> wrote:
>>>> On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
>>>>> + * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on
>>>>
>>>> Still needs s/Returns:/Return:/g
>>>
>>> FWIW, both work to accommodate the variance across the kernel,
>>> although
>>> I think only the latter is documented and recommended. It's also
>>> the
>>> most popular:
>>>
>>>     10577 Return
>>>      3596 Returns
>>
>> I'd like to keep "Returns", since that's what GPUVM uses already
>> everywhere else.
> 
> Ok. It looks like the Returns: are converted to Return in the rendered
> output so I guess that's why it's the form that is documented.
> 
> I pointed this out since in the last review you replied you were going
> to change it, and also when the code starts seeing updates from other,
> it might become inconsistent if those patches follow the documented
> way.

Sorry for that. I think I wrote this answer when I was at XDC and hence was
a little bit distracted.

> 
> But I'm OK either way.

Ok, then let's just keep it as it is.

> 
> /Thomas
> 
> 
>>
>>>      1104 RETURN
>>>       568 return
>>>       367 returns
>>>       352 RETURNS
>>>         1 RETURNs
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>
> 

