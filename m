Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E146BCFED
	for <lists+nouveau@lfdr.de>; Thu, 16 Mar 2023 13:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A66610E0B7;
	Thu, 16 Mar 2023 12:53:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.fsf.org (mail.fsf.org [IPv6:2001:470:142::13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675AE10E104
 for <nouveau@lists.freedesktop.org>; Thu, 16 Mar 2023 12:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fsf.org;
 s=mail-fsf-org; h=MIME-Version:In-reply-to:Date:Subject:To:From:References;
 bh=1v03i9w4oGryefZKGUc1+UmSAAT5Kphu6HZLvqVKk7A=; b=Jos5By9v55nDDGvJPhe0es3Dg
 Mov6vYh7bI9twoxztULyVIzIG5fPSRuSdARm/ImhfHpVqwu5ukpUgBpW99dGolyx2o+baGZOnKD4s
 iyDAY4hi7r40zERDQsnm1vMhBQfmWxDklbF/6Is6zM/VibDlyGz9OiwkRqzluxRUSWZ2Cjy4UpS7z
 iKYs9rbe8OC4aLMoHt6a5YMf9u36lfIWz6kgB2G0/KQyCjkEdhKfc0mu/5NK5Jw5qMoMR2D3ZGCVa
 Yo1Urwc937oDe8tDjELaCTfQss+FpiiT1kIIgcBAxrCbdbgZpYtRNhtV1m16se7IdcWd7NH0EzUi2
 LlCImUQLA==;
References: <87bkky51ri.fsf@fsf.org>
User-agent: mu4e 1.9.0; emacs 29.0.50
From: Ian Kelling <iank@fsf.org>
To: Ian Kelling <iank@fsf.org>
Date: Thu, 16 Mar 2023 08:51:52 -0400
In-reply-to: <87bkky51ri.fsf@fsf.org>
Message-ID: <87edpozwkq.fsf@fsf.org>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Nouveau] Any tips to avoid Nouveau crashes & freezes?
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Small update: Using llvmpipe for running OBS seems to fix the crashes &
hangs. It uses a lot of CPU, like 7.5 cores vs around 1 without, but
that seems fine for our purpose. Running OBS AMD gpus uses this much cpu
without explicitly asking for llvmpipe.
