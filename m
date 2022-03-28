Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7944EA24F
	for <lists+nouveau@lfdr.de>; Mon, 28 Mar 2022 23:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C5410EAEE;
	Mon, 28 Mar 2022 21:18:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C72B10EAEE
 for <nouveau@lists.freedesktop.org>; Mon, 28 Mar 2022 21:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648502316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o/20j76lcDPeDTIfcY54M2M3yeP1hzS1Frzdk4vK99I=;
 b=OFLBoBS/3HdKJlmkE9GZ+x3nfkj1sQkGBWizbDquIgBu0A3jLmVRGFfO9XeR011XraKVKn
 cAXBoGQ4NE8+6xZDiLNEINMoLj+Nfu45pmQhujhtYQUl0zCGiJMwfWyWLKuf6E2ORuBa0Q
 G40hU0WB6gASUYC2JAJ59RlRDz9zBcY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-qGuI8ofiMJm3Rakg6pE79Q-1; Mon, 28 Mar 2022 17:18:29 -0400
X-MC-Unique: qGuI8ofiMJm3Rakg6pE79Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 h11-20020ac87d4b000000b002e1c9a3ae51so13266462qtb.0
 for <nouveau@lists.freedesktop.org>; Mon, 28 Mar 2022 14:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=o/20j76lcDPeDTIfcY54M2M3yeP1hzS1Frzdk4vK99I=;
 b=xwMzjnlqz3K0JSfm6dK5HdKmA8Tg7S+/0V1bxj6jgaLq/RZHbhcdpEndJsefcgJLKo
 sPRXGtOu/+IFr2i6U8pZ/JBS2/AkzlFpYxNK9MuB0qzVsHxtatiLUljZAHNt4iNeF1pj
 Ckxq0vCiSryqDc705amTjcyDedEbLno5k41eiweAr3ijXxuy9NIvE48xR2SLL4M92/za
 /uHakNuzlxg2IlfFsg4JtPYPc0QCFnASebdBPflvjTlaycE2WxP4rTaUSkrfqx1qonfL
 h3myoNMDEFbyoFAftn0cHpnHGzyZaUB+EevGrkZsdUEWdY+wcO0F7KO7hiHE2MVo8adA
 0t6g==
X-Gm-Message-State: AOAM533EKtypuAc5Be+ojDrMZcZ/XoRYOBKnr+6bZPai94SP8p2TZKwq
 V8sc/aXSm2pAT114DPwvRBmAwcnZdNsh+7xoIfDE2UxEZx78cKokgmOX4Li0KlIzMn/hKjHURM/
 NvXbfTKh30lj2ren9Qxa9LCJZzg==
X-Received: by 2002:a05:6214:29c8:b0:440:fac2:a6c with SMTP id
 gh8-20020a05621429c800b00440fac20a6cmr23153268qvb.96.1648502308562; 
 Mon, 28 Mar 2022 14:18:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx80FvxqgxoMsKHifZxJPlSaASMzEtm2PCjdcW91NHHki6CRsyrlYXzQuiJUFDSkSZnID/Qgg==
X-Received: by 2002:a05:6214:29c8:b0:440:fac2:a6c with SMTP id
 gh8-20020a05621429c800b00440fac20a6cmr23153243qvb.96.1648502308333; 
 Mon, 28 Mar 2022 14:18:28 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 br13-20020a05620a460d00b00680d020b4cbsm2856816qkb.10.2022.03.28.14.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:18:27 -0700 (PDT)
Message-ID: <dc0ead0da30d0ccf8c4c57a2548d293c57407080.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Mon, 28 Mar 2022 17:18:21 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.DarkModeFix.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] 2022 X.org Foundation Election Candidates
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
Cc: board@foundation.x.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

To all X.Org Foundation Members:

The election for the X.Org Foundation Board of Directors will begin on 04 April
2022. We have 6 candidates who are running for 4 seats. They are:

    Emma Anholt
    Shashank Sharma
    Ricardo Garcia
    Mark Filion
    Lucas Stach
    Alyssa Rosenzweig

To be found in the link below below are the Personal Statements each candidate
submitted for your consideration along with their Statements of Contribution
that they submitted with the membership application. Please review each of the
candidates' statements to help you decide whom to vote for during the upcoming
election.

    https://www.x.org/wiki/BoardOfDirectors/Elections/2022/

If you have questions of the candidates, you should feel free to ask them here
on the mailing list.

The election committee will provide detailed instructions on how the voting
system will work when the voting period begins.

Lyude Paul, on behalf of the X.Org elections committee

