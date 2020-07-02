Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B9212BFD
	for <lists+nouveau@lfdr.de>; Thu,  2 Jul 2020 20:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FDB6E199;
	Thu,  2 Jul 2020 18:16:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6493F6E199
 for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2020 18:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593713789;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=CysWFQlB8amaDV/zf/6K2RwGGTlIHdfqtQ/vGdNKzx0=;
 b=cT8j/MXR/2AOXG0Laorl2WntJ5SrNfmPnR39Dp9gH/i9gnXbYXOHFNfFM73lf5GXg4G3XE
 0k3/pFTEgwoDdNyFln/ugIjgYI1plKwJFQeju4OoGta0zFokkRPJd6VisGYdj2NnShlDu6
 wO1jc+qxVDq8P5+5SqPYltKp6yToUzc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468--2RT4tykOqe3VwVeKQCiPQ-1; Thu, 02 Jul 2020 14:16:13 -0400
X-MC-Unique: -2RT4tykOqe3VwVeKQCiPQ-1
Received: by mail-qk1-f197.google.com with SMTP id 13so8140129qkk.10
 for <nouveau@lists.freedesktop.org>; Thu, 02 Jul 2020 11:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=CysWFQlB8amaDV/zf/6K2RwGGTlIHdfqtQ/vGdNKzx0=;
 b=IzqsCRfsSgOU1VdDUhXYhBzSLZ3a2AleTtXUJNcaxvesY7PDAmhU/xvlSFTRP+rCVd
 JG6JLOrgfEp+SQmRIFDCj7n+cHCandBh9eeMLOdwKWTvU5MMQt9PDeVapBF0HYZwpvDc
 ErnLNtYWyBIoazb6KRkYh3O97TCuLICDNwMkWSEGbpmYa02+uCTt+Ndfx81exfVDh13V
 fa5UcpJPgdsPlEQeoLHb0s8TPm1N7uORNsTdVmFZ0yq+BWBhqbVZ2keG/15SK92DDPEJ
 C7KKkOXNxRELpBdu2PKEDkjw/sTeP6MCDJU278WbryYq2oInwKB2iwMoznQoNLGg15lN
 eWvA==
X-Gm-Message-State: AOAM531QjFnl9fqOB7B2uImEKms7/lIdyqBIXFE9B+MDwBOO5IQV+IpQ
 wMwiaIuVuuiESCKrkFRSMNNxG1D0T08b05MxOzuW5X3SXsz6kJVqN6ASKPtPIkKIXBCIjb4KZ/r
 P6/tptZD22DgJ4NGQ4IYT312RbA==
X-Received: by 2002:aed:22ef:: with SMTP id q44mr31046773qtc.333.1593713773168; 
 Thu, 02 Jul 2020 11:16:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXyOxeQA+Kem4gTuH5iyHRViygW5BAtNuoVYcOw8/m6yJYu4IP877jS4GUpAL4QU1OmN+obg==
X-Received: by 2002:aed:22ef:: with SMTP id q44mr31046749qtc.333.1593713772864; 
 Thu, 02 Jul 2020 11:16:12 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id c25sm1510750qka.63.2020.07.02.11.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 11:16:12 -0700 (PDT)
Message-ID: <5fcb1490dd12b0e2da3fbb34e5431ab3ce162839.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: IGT development <igt-dev@lists.freedesktop.org>
Date: Thu, 02 Jul 2020 14:16:11 -0400
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] Getting reviews for nouveau contributions in igt?
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
Reply-To: lyude@redhat.com
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi! I haven't had much luck asking around in IRC, so I figured this would be the
next place to start. As many of you know I've been working on getting nouveau
into good shape with igt-gpu-tools, now that we've finally finished implementing
CRC support thannks to nvidia's help. I should note that the patches for this
have been accepted into nouveau, Ben's just working on rebasing them on top of
some of the display refactoring + other stuff he's been working on. So they
should appear in drm-tip in the near future, but they're still available on
patchwork for anyone who wants to try them:

   https://patchwork.freedesktop.org/series/78803/
(also needs https://patchwork.freedesktop.org/series/78915/ )

ANYWAY-the first question I had was whether anyone on here would be willing to
help me with getting acks and/or reviews for some of the nouveau-related igt
patches I've sent upstream? One of the patch series adds some nouveau-specific
CRC tests:

   https://patchwork.freedesktop.org/series/74811/

The others add some missing bits to some basic kms tests that I noticed while
doing CRC bringup:

   https://patchwork.freedesktop.org/series/74806/ - fixes false-positives in
   kms_plane plane-position-hole tests

   https://patchwork.freedesktop.org/series/74808/ - adds a test to
   kms_pipe_crc_basic to exercise disabling CRC capture on a pipe immediately
   after said pipe being disabled.

The second question that I had is in the future, for adding nouveau-specific
tests is it acceptable for me to just get reviews from other nouveau developers
or should I be trying to pull people in from this mailing list from outside the
project?

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
