Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C054A9DD5
	for <lists+nouveau@lfdr.de>; Fri,  4 Feb 2022 18:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC5D10E82C;
	Fri,  4 Feb 2022 17:40:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A049010E3A4
 for <nouveau@lists.freedesktop.org>; Fri,  4 Feb 2022 17:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643996411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Fgk2tPp8Iez8ffo3teobZs6lfET8NrmEOulKtLL6l8=;
 b=hgu4N+S2gNdG1xMhXdat5E6BCLq/KTAMIgvMNi0eK4csndApUPlZp0/k0dlKHe6jbeZJdm
 Ade/UI/wsT6mi0oG5a5pqi1KLVLaexIvOr1LzNja1AKUhUofqDKluRX+tBetqc/l0phA5P
 1h/vBToWtlExXnm1DgcDuSjqS9KBhk0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-1aUsU6MPNgWLdlsQjb9j1A-1; Fri, 04 Feb 2022 12:40:08 -0500
X-MC-Unique: 1aUsU6MPNgWLdlsQjb9j1A-1
Received: by mail-qk1-f197.google.com with SMTP id
 u12-20020a05620a0c4c00b00475a9324977so3973925qki.13
 for <nouveau@lists.freedesktop.org>; Fri, 04 Feb 2022 09:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=+Fgk2tPp8Iez8ffo3teobZs6lfET8NrmEOulKtLL6l8=;
 b=ouusbzKDF6qzrcul0PxjkDcGzGC2uIfGHnjr2nWJbvOcq99+cnKD5yUdKzWJ7JW0tm
 +pcApvlJSRA7PCPjdhilLGWzb77bjQBStT9N0OYPF97+vhb6RX1WzLu7kyykA64cnGI8
 AQPp0AP5Cpwvtw2pb7hs1MpHSoP8K3cp/7oToCe0OgCOVecrKEVOFH8mp9nZOGcFwR9j
 v4rRiEGRwfVagrLZ+cN+gsyyff3cCxvASdMylnl0RUJxNBMX4yRH/cgEUrZJRR7kJ41x
 bk0P/bZF7RWrbk9z/c+SItN7arP9/cDULors8akGVqR8f0fHiTbDcC/pDqnLck+PmeGf
 /wqg==
X-Gm-Message-State: AOAM5308BUV7rDCJTsEjCTzy9xqFhi3wY+oBecL6Su+zDvIwqQhGdR3w
 LYiVcRpGX7Xnx+Il1eFp7WzP7Mp9J/8YEXYp/iWfJvvAh6dK8b2uF2XAj2udyZEJRchI6yTsOaY
 gTvnUjwov5e5mugx47vZ1is6OTw==
X-Received: by 2002:ac8:578a:: with SMTP id v10mr76192qta.148.1643996408380;
 Fri, 04 Feb 2022 09:40:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKdGHijSYkEZ0PZ6zI7XULxLGuuiXeTX+kTLZtxdulDdoNZ2sUxc4s+6mCyl5zpu6dwwjJCg==
X-Received: by 2002:ac8:578a:: with SMTP id v10mr76176qta.148.1643996408156;
 Fri, 04 Feb 2022 09:40:08 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id w22sm1599186qtk.7.2022.02.04.09.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:40:07 -0800 (PST)
Message-ID: <8db37efd8113f33107175b353f1f996523db7b9c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Fri, 04 Feb 2022 12:40:05 -0500
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


