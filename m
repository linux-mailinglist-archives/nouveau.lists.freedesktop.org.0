Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB11598FAD
	for <lists+nouveau@lfdr.de>; Thu, 18 Aug 2022 23:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA83F10F0C3;
	Thu, 18 Aug 2022 21:38:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEF310EF3B
 for <nouveau@lists.freedesktop.org>; Thu, 18 Aug 2022 21:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660858682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lScf9Dov1eqBcZW4o7xmR0mpAM2ZlF/Ug/GDTkmjTuQ=;
 b=VFZa+lIpWZHDuq1f4tytOW3QR6fv+gJ5cX0Jsnc5Xdb9tBvf7f8gBqWuG/jNljuM3yN44M
 x4eMlly1eT7/UVmZ/xkFoaI8xqu/u7U5sUQnLR9HQjDdr50eKXREZ9trPAAEaiumdN41GQ
 OS/Qj4SSxau77CNqA0SKxoGbOiH7OSI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412-Hi1_I849MPmGjsiX10Zi2A-1; Thu, 18 Aug 2022 17:38:01 -0400
X-MC-Unique: Hi1_I849MPmGjsiX10Zi2A-1
Received: by mail-qk1-f198.google.com with SMTP id
 bk21-20020a05620a1a1500b006b5c24695a4so2460581qkb.15
 for <nouveau@lists.freedesktop.org>; Thu, 18 Aug 2022 14:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization:date
 :to:from:subject:message-id:x-gm-message-state:from:to:cc;
 bh=lScf9Dov1eqBcZW4o7xmR0mpAM2ZlF/Ug/GDTkmjTuQ=;
 b=DMhqvheKmHNr5ohpyILuovy+JAxVRAiT/jNcsVhyEuCLLDUn8sNt7l9EIXsPG0f+Se
 4k+34o9zczhfIjgoRH/9mFYSNJ28XGSiKTRFkmMv54VyU/UUh+xz7PKgDIt2PGpxVBES
 ntCFhWXNYaAoeKa5MmEp9e360rdhySwhujrwKSnYaYaW9noVaXQQqF+xl/uE7Urh02Yh
 EmsuG+/3eBPw4MNmPq93xO7F03MR+MeHWZYUaTUY3ZESWWqjysgSVVzPsloPnQ4rzEcG
 vU00PwOwV/oXt7DY7B1lY3t3MPnO7h/6T7E7/MZ/RbXkLTiIgkp6m7eGobte8+AmRdYp
 RRqg==
X-Gm-Message-State: ACgBeo0mFSoWGM6+O855rV9BtYmgRnJ5xOQSIJNSnEb37REAxcF0dvEc
 jVNBM4ld1WVfYAp1C+JyyWBKq84NbMtzEX01eMyfPwuYiWD4JK/SX7u1tOB5HdAfKDZ/i8NRFlp
 B2rFBw8v0RQFA8D54QFPjY61Klw==
X-Received: by 2002:a05:620a:450e:b0:6bb:a4cf:de01 with SMTP id
 t14-20020a05620a450e00b006bba4cfde01mr3660394qkp.636.1660858680551; 
 Thu, 18 Aug 2022 14:38:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4eJbJ6MHspJZofKg/uG3Q4hmV5Ec879fTMGZtNRbiHqYpbk/vZLhJu7X5k38OzaQEGP0vR+A==
X-Received: by 2002:a05:620a:450e:b0:6bb:a4cf:de01 with SMTP id
 t14-20020a05620a450e00b006bba4cfde01mr3660386qkp.636.1660858680333; 
 Thu, 18 Aug 2022 14:38:00 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 f9-20020ac84989000000b0034490214788sm1714155qtq.49.2022.08.18.14.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 14:37:59 -0700 (PDT)
Message-ID: <b759d459b1a5a5446e838e80159711ec9ceb2174.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: freedreno@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Thu, 18 Aug 2022 17:37:59 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] Requests For Proposals for hosting XDC 2023 are now open
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

Hello everyone!

The X.org board is soliciting proposals to host XDC in 2023. Since
XDC 2022 is being held in North America this year, XDC 2023 is expected
to be in Europe. However, the board is open to other locations,
especially if there's an interesting co-location with another
conference.

If you're considering hosting XDC, we've assembled a wiki page with
what's generally expected and needed:

https://www.x.org/wiki/Events/RFP/

When submitting your proposal, please make sure to include at least the
key information about the potential location in question, possible
dates along with estimated costs. Proposals can be submitted to board
at foundation.x.org until the deadline of *September 1st, 2022*. 

Additionally, an quirk early heads-up to the board if you're
considering hosting would be appreciated, in case we need to adjust the
schedule a bit. Also, earlier is better since there generally will be a
bit of Q&A with organizers.

And if you just have some questions about what organizing XDC entails,
please feel free to chat with previous organizers, or someone from the
board.

Best regards,
	Lyude Paul
On behalf of X.org

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

