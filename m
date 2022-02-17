Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCA94BAAA1
	for <lists+nouveau@lfdr.de>; Thu, 17 Feb 2022 21:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC5210E790;
	Thu, 17 Feb 2022 20:08:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF1A10E790
 for <nouveau@lists.freedesktop.org>; Thu, 17 Feb 2022 20:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645128509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sK34GucLf1EjDJhzzUqx7/Oepkk2e4FDf8Dxqp0a2xc=;
 b=QOFEJYoZWCdEY7plB1eABaVH0qZEPi5JoDdINdaiJscUczNddB+8ID6UtuYcKVnzW3gTro
 hQBCn0N4Ih22EpbrGEwrvHbdn6HLdg49uW/6JcjAlODwh3BN0dnksKgB5yKVExG0gJzmi2
 fpyWg6bnPox049c+b463M6kOm9ZdllM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-XVynXM_rO5eU9ofExO2ocw-1; Thu, 17 Feb 2022 15:08:20 -0500
X-MC-Unique: XVynXM_rO5eU9ofExO2ocw-1
Received: by mail-qk1-f199.google.com with SMTP id
 t10-20020a37aa0a000000b00605b9764f71so5179433qke.22
 for <nouveau@lists.freedesktop.org>; Thu, 17 Feb 2022 12:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=sK34GucLf1EjDJhzzUqx7/Oepkk2e4FDf8Dxqp0a2xc=;
 b=Vvi9pG2eJ78UU5O9us5GQKYhM6T+b8Qa0GcYhmsz/S4JIedDC2LAAjA3XkVcTPCJq3
 pcsO/fd5i2JQHF4NG2hfcMYKDGZAKBiJavhJMVwheWxF94T+bFcofd6uBA91XkJjjTAR
 PUAvz7MAtA7TvbSkUm4dMDP1zDHNJIdXBTJyzNYOBzThM7J9occ05yjb8ryuX1wIFXyg
 0CD5WebzIeTqlqUrBHgG9WtQUr/Gc6IzVnA1mcgI7kXiqYHIvn7nnxYWbPyvVz69AkFo
 2g6qr6I248lCUlGp70TtySJ1HuBp61LRnIeCy2WLC6Q4AP0bMxZIaDCJiv9myrYv6cS8
 orzw==
X-Gm-Message-State: AOAM531VCyIC7anKPQ6VqM4gEv1tst9zJOW1sPOCXP4n9k22sqiexXAS
 yUbcxJDwpi9H7oHR44xYkToVmvZzyI1OyTosGSv1DFEIDBsaTGVb7Kvm+3Z7lR2NpDXs5mXnC/y
 FMPd+GGjZkbYkhqz3hlS16FOFTg==
X-Received: by 2002:a05:6214:2528:b0:42c:1599:12 with SMTP id
 gg8-20020a056214252800b0042c15990012mr3420827qvb.76.1645128500386; 
 Thu, 17 Feb 2022 12:08:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycbxYMpaPo61PhTMr/DZq7LFboQhm1n/b16fcARkC40ffOKYC2XX1xA9CYu8QhyI7O53ib0A==
X-Received: by 2002:a05:6214:2528:b0:42c:1599:12 with SMTP id
 gg8-20020a056214252800b0042c15990012mr3420803qvb.76.1645128500128; 
 Thu, 17 Feb 2022 12:08:20 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id i4sm22182394qkn.13.2022.02.17.12.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 12:08:19 -0800 (PST)
Message-ID: <db5decb525e7ab36cd4875ef5c6bba942b46d7c7.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: xorg@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Thu, 17 Feb 2022 15:08:18 -0500
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [Important!] 2022 X.Org Foundation Membership deadline
 for voting in the election
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
Cc: board@x.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The 2022 X.Org Foundation elections are rapidly approaching. We will be
forwarding instructions on the nomination process to membership in the
near future.

Please note that only current members can vote in the upcoming election,
and that the deadline for new memberships or renewals to vote in the
upcoming election is March 17th 2022 at 23:59 UTC.

If you are interested in joining the X.Org Foundation or in renewing
your membership, please visit the membership system site at:

https://members.x.org/

You can find the current election schedule here:

https://www.x.org/wiki/BoardOfDirectors/Elections/2022/

        Lyude Paul,
        On behalf of the X.Org elections committee


