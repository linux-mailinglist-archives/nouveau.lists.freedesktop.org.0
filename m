Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2B54DB901
	for <lists+nouveau@lfdr.de>; Wed, 16 Mar 2022 20:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F3110EA2F;
	Wed, 16 Mar 2022 19:47:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501BC10EA31
 for <nouveau@lists.freedesktop.org>; Wed, 16 Mar 2022 19:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647460062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J0oI+0ISdRle63jGaS9/UHYnEMzVjtXKfWa9O2AXWGk=;
 b=KFn8d7GmTGQYetMlJ0WFIlMQndVNyZwwG1/7U6IXutq0aE5/QkBI8jyI+YlMT352rZMmXy
 v6snEBQhs+awhfiQqxq+VM4XCBbIU5jcpmlRqHmuY5Xl44asr3xTOpLEuPr/JlkusQi2ZK
 gF0N2GBEJbyv/MC7uaaBp5P7P5BRDAU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-FijUGkjXOP6FEGcjwV7vUg-1; Wed, 16 Mar 2022 15:47:39 -0400
X-MC-Unique: FijUGkjXOP6FEGcjwV7vUg-1
Received: by mail-qv1-f72.google.com with SMTP id
 s14-20020ad4446e000000b00440d3810126so2040668qvt.5
 for <nouveau@lists.freedesktop.org>; Wed, 16 Mar 2022 12:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=J0oI+0ISdRle63jGaS9/UHYnEMzVjtXKfWa9O2AXWGk=;
 b=rYmXwTe3vBsy67zjKVpouDci9lwk5+acVGlZc3ycPDpf9ZYtFGrLNqAsE6lqwhVhsO
 zBAtY1yr2a6po/uhJRkWY25KqW6VE1j9pzC5gInh8Z17MBtzDUT1iY0LNEJNaiV4oDMS
 3AVGArGiMmITLQF9C70j8qBRwGLF0cjd3HeVGIRlcXqsgtgtI3eKPziRTqD/hpXclJED
 tkNXI4KZLxo+CNFRtVeE7jz4OkZGzHz+qWsky58fGYafzcnxFOP1iu6yXtGdp0VLAkA8
 5Iza1SC2uCzr++OptWSV6gG/hMOxQIDboicVPtJZ7g7Qg3hKSszAenuLPzg/kaIbJdJH
 KPGQ==
X-Gm-Message-State: AOAM530DEceUBDmJaoVYytLGyCDciwruzGahx/9CQGRzhCZnRVnF7M0w
 2pw4Lso9SVtW6HtwO1VfyDrjz7vUW7b1ZZYFnKKLd6VysY2FsfsFOmqyyOiEXJ772+og7HyHrlB
 DsJBbbfqe7uzYd6kXJF1u23Oz8g==
X-Received: by 2002:a05:6214:dcb:b0:435:cb9c:b0b4 with SMTP id
 11-20020a0562140dcb00b00435cb9cb0b4mr1081804qvt.119.1647460057832; 
 Wed, 16 Mar 2022 12:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd6yBQg5t9nqQt2lYJt49ehTyptVw7upMg0uojKxcC/Ku5glPD14dTM2VhzVpmsxZJOfIDgQ==
X-Received: by 2002:a05:6214:dcb:b0:435:cb9c:b0b4 with SMTP id
 11-20020a0562140dcb00b00435cb9cb0b4mr1081787qvt.119.1647460057597; 
 Wed, 16 Mar 2022 12:47:37 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 c27-20020a05620a165b00b0067d32238bc8sm1237699qko.125.2022.03.16.12.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 12:47:36 -0700 (PDT)
Message-ID: <0e029c57f314bb6139e72ff22a3f7667c99b7f26.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Wed, 16 Mar 2022 15:47:35 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] 2022 X.Org Board of Directors Elections Nomination period
 is NOW
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

The Board consists of directors elected from the membership.  Each year, an
election is held to bring the total number of directors to eight. The four
members receiving the highest vote totals will serve as directors for two year
terms.

The directors who received two year terms starting in 2021 were Lyude Paul,
Samuel Iglesias Gonsálvez, Manasi D Navare and Daniel Vetter. They will
continue to serve until their term ends in 2023. Current directors whose term
expires in 2022 are Emma Anholt, Keith Packard, Harry Wentland and Mark
Filion.

A director is expected to participate in the fortnightly IRC meeting to
discuss current business and to attend the annual meeting of the X.Org
Foundation, which will be held at a location determined in advance by the
Board of Directors.

A member may nominate themselves or any other member they feel is qualified.
Nominations should be sent to the Election Committee at elections at x.org.

Nominees shall be required to be current members of the X.Org Foundation, and
submit a personal statement of up to 200 words that will be provided to
prospective voters.  The collected statements, along with the statement of
contribution to the X.Org Foundation in the member's account page on
http://members.x.org, will be made available to all voters to help them make
their voting decisions.

Nominations, membership applications or renewals and completed personal
statements must be received no later than 23:59 UTC on 20th March 2022.

The slate of candidates will be published 28th March 2022 and candidate Q&A
will begin then. The deadline for Xorg membership applications and renewals is
31st March 2022.

Cheers,
   Lyude Paul, on behalf of the X.Org BoD

