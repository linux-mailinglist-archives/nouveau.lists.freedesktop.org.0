Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F96584794
	for <lists+nouveau@lfdr.de>; Thu, 28 Jul 2022 23:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EF1113E4B;
	Thu, 28 Jul 2022 21:17:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3581134F4
 for <nouveau@lists.freedesktop.org>; Thu, 28 Jul 2022 21:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659043069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o/OfbOToIOdGriD6UGrknJy8SryGGj67M+1E/6CU+Ec=;
 b=fQkyUdw6JxbXwes5F869yMFAV+qMV8sZ9M9DQ/fUC1yQe1LhCFyR8JJNckEbDrllRhrwPh
 16q/a13Fdor2gjsNAMpMoez8+jjE1fuNkb+f62flsu/F5tKhEtIGf4J/l0R004t0Izcst2
 gcpFPzSm5uYajpevJrbF3IwPFQdTDQM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-YERUJeXjNUKYGoDn75_Tqw-1; Thu, 28 Jul 2022 17:17:48 -0400
X-MC-Unique: YERUJeXjNUKYGoDn75_Tqw-1
Received: by mail-qv1-f71.google.com with SMTP id
 li6-20020a0562145e0600b004744011ed4dso2113180qvb.22
 for <nouveau@lists.freedesktop.org>; Thu, 28 Jul 2022 14:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=o/OfbOToIOdGriD6UGrknJy8SryGGj67M+1E/6CU+Ec=;
 b=T9M7bGJrWNot+kDe4lhjter0KEkykXZRD5EmJvFEy5N8nZhMj/dW9nu2XD8hUvjDEM
 +Xo+A1gX+XN6+qG3pqmixo2yO9ZvzhVJkzsEnkS9NEc9TnNmgbYAAnSEx7rSotGtX+At
 VzGNQkNX7B7fLd6GqB0YkYZDome3m4jxcWJAnNrcUpISIhRnUtBPpKZ8oGrfX2LWX8yu
 juAkoZ1JSvTRIRyHEDj3i/tdc9/wjJgO+ApJo0uUoHjLtcfAuNyyqMjw439+wtGS+H5J
 ePZSeYB1UH8ZuwD5axNowFdu2zrpur77XWNIg8Q8tXFuODtiHuHE36XJMn/KG3up5aQI
 7T+Q==
X-Gm-Message-State: ACgBeo0gwweZNw1StubdrlA0kBHSzx42HtrSl+4HQogMQYdLveu6tCS5
 aTchdtYe0Tb+YetZxVVemKUZ3P9wIkiddr7L3SZK5H2yPi7e+r8HPpz9Ul8fIcp84mBZ4Po+h6a
 YWWXJtTh2pAnweOiOz3K6sjj3KQ==
X-Received: by 2002:a05:6214:d0b:b0:473:6ec:7a88 with SMTP id
 11-20020a0562140d0b00b0047306ec7a88mr745095qvh.15.1659043068301; 
 Thu, 28 Jul 2022 14:17:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR60uCxaFzrGMtUq5KKxNBTJRHhJG8jPcfbfPtMDcncqIYPU6qs8lx55P8jDBfNQhF2MZEP13g==
X-Received: by 2002:a05:6214:d0b:b0:473:6ec:7a88 with SMTP id
 11-20020a0562140d0b00b0047306ec7a88mr745075qvh.15.1659043068088; 
 Thu, 28 Jul 2022 14:17:48 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 u4-20020a05620a0c4400b006b5c5987ff2sm1151388qki.96.2022.07.28.14.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 14:17:47 -0700 (PDT)
Message-ID: <6988c4ad3e230b8d252a2edff190502a0b17f4f2.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>
Date: Thu, 28 Jul 2022 17:17:46 -0400
In-Reply-To: <20220711082614.GA29487@lst.de>
References: <20220711082614.GA29487@lst.de>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] susetting the remaining swioltb couplin in DRM
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi! Sorry about the slow reply to this, been busy with a bunch of other
pressing nouveau work lately.

Anyway, the steps look pretty simple here so I can see if I can write up a
patch shortly :)

On Mon, 2022-07-11 at 10:26 +0200, Christoph Hellwig wrote:
> Hi i915 and nouveau maintainers,
> 
> any chance I could get some help to remove the remaining direct
> driver calls into swiotlb, namely swiotlb_max_segment and
> is_swiotlb_active.  Either should not matter to a driver as they
> should be written to the DMA API.
> 
> In the i915 case it seems like the driver should use
> dma_alloc_noncontiguous and/or dma_alloc_noncoherent to allocate
> DMAable memory instead of using alloc_page and the streaming
> dma mapping helpers.
> 
> For the latter it seems like it should just stop passing
> use_dma_alloc == true to ttm_device_init and/or that function
> should switch to use dma_alloc_noncoherent.
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

