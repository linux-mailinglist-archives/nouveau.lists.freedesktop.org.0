Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF97A7E4892
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 19:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C21410E5F0;
	Tue,  7 Nov 2023 18:46:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A9B10E5F0
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 18:46:30 +0000 (UTC)
Message-ID: <dbf8c83e-2d1a-49e8-b7f4-b368e61f01cd@dakr.org>
Date: Tue, 7 Nov 2023 19:46:15 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Timur Tabi <ttabi@nvidia.com>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
References: <b9a97887-9b58-4518-8dd8-3865afb9279b@moroto.mountain>
 <f9a53aa8399313a323232744be57c9908f674f1b.camel@nvidia.com>
 <f6381720-3b0b-40be-a705-0decdf0a3800@kadam.mountain>
 <fa523631-480d-496a-a370-ebda589b441f@dakr.org>
 <ee63371a80c54c03793b872f1e33af410ecd3c88.camel@nvidia.com>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <ee63371a80c54c03793b872f1e33af410ecd3c88.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [bug report] drm/nouveau/mmu/r535: initial support
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/7/23 19:17, Timur Tabi wrote:
> On Tue, 2023-11-07 at 19:11 +0100, Danilo Krummrich wrote:
>> I think the problem already starts with gf100_bar_new_() not setting its
>> pbar argument to NULL on failure, but this code assuming that.
> 
> Isn't it standard procedure for functions not to write to output parameters on failure?

Didn't want to say gf100_bar_new_() is wrong, but rather this function is
wrong obviously taking the wrong assumption.

> 
>> Generally, I think it would be better if all those functions would return
>> an ERR_PTR on failure.
> 
> Agreed.
