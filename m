Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103659BB3D3
	for <lists+nouveau@lfdr.de>; Mon,  4 Nov 2024 12:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4842F10E039;
	Mon,  4 Nov 2024 11:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Cr+E4Qdh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AFE10E039
 for <nouveau@lists.freedesktop.org>; Mon,  4 Nov 2024 11:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730720971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FajwGdAb1Fq2c51xU3s+pLkKIio9AZFquBlJwhWBQaM=;
 b=Cr+E4Qdh3yD3osh+sWMWPnW1IOcDPTzzx70ZBXpHjp94Z8X7rYs+0y15Bd7FU2v0RHq3vi
 JLBsL1kvXTKSas4BvWzANdbDKHV3iCYhO2WC5d2bCynjgKj3WdLaFyieTzPvZaeYKsKlQn
 nKeqz3ve59McWCX0zXMX4lPiP6qDlq8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-3PPth-nyMsu_JrdHVtzCZA-1; Mon, 04 Nov 2024 06:49:30 -0500
X-MC-Unique: 3PPth-nyMsu_JrdHVtzCZA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4315af466d9so27578315e9.3
 for <nouveau@lists.freedesktop.org>; Mon, 04 Nov 2024 03:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730720969; x=1731325769;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FajwGdAb1Fq2c51xU3s+pLkKIio9AZFquBlJwhWBQaM=;
 b=B7b4YK6FhDdWigiqJlBOdPGXsuHPv58D2A+BkwC6jA6ak+m1Xpxj69nAtCMdq9UKg2
 Lpj+1JNiSK9Hkx0wie++ZM8QhwDAhPZIg6OROswP7G2HUBHIeP5oxHZ1A8YsVSj4XJ0f
 TPIqn14fxe/wngRXx4B9VrpoFhnaIXf+y4l9sE13gcd2ACktRh4jZCe2xwxpQuVjXMv7
 A4u1MqxweHlKvIu6irnM/Fs5vq4ei9Ds7qX6mAHxIBwqvEcErvJ8AtdA1BwkenW1TyVS
 ZpjuzjV+XftjrjqEjkOTAtkn0PNN6iO0jcYFxWEI0a5mqbk0b0suoOSwUPD8kfmgR8SZ
 u38Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+QEzodWYEmJnN/s2yhde15dEJYFzzy8Jp1TXsT/f0Le74SSCQv5j50e4LVYZ6qPFp8Gp7obZW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIEOd1My9gnCHu99wymsBnLvzT4Rjq7tqzzm70bpeEjbao7pue
 eWkEJ9aGy6s6neESyrznGAxY4Sl9txqX/OVBbjaDAgJoy3PEyq1+ZakDpDuj24Lbmz+YEC6UIB6
 IAEgomSBnaLimhZpzTK455liBJOXhf77dRnkKYIgEJYJHhd7pkMZ9SEnuxcBAsRY=
X-Received: by 2002:a05:600c:4e8a:b0:42b:af5a:109 with SMTP id
 5b1f17b1804b1-43283284867mr92634245e9.24.1730720968907; 
 Mon, 04 Nov 2024 03:49:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0mfmkYvn5+DPu5WFAP6Bwmiw9OPX5hMQilF72BbPZbvkwp7CgzH1rQ3k70jUtL6XfPi25oQ==
X-Received: by 2002:a05:600c:4e8a:b0:42b:af5a:109 with SMTP id
 5b1f17b1804b1-43283284867mr92634035e9.24.1730720968533; 
 Mon, 04 Nov 2024 03:49:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7d20sm13165426f8f.7.2024.11.04.03.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 03:49:28 -0800 (PST)
Message-ID: <8b880d48-ee98-42ab-afb9-a203cb27d6e7@redhat.com>
Date: Mon, 4 Nov 2024 12:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] drm/nouveau: Add drm_panic support for nv50+
To: Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20241022185553.1103384-1-jfalempe@redhat.com>
 <5af437fd77cc7f9514817f14299f352cba1c54a7.camel@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <5af437fd77cc7f9514817f14299f352cba1c54a7.camel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 31/10/2024 21:29, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 

I just pushed it to drm-misc-next.

Thanks & Best regards,

-- 

Jocelyn

